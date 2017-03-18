#include "appcore.h"
#include <cstdlib>
#include <sstream>
#include <cstring>
#include <iostream>
#include <cstdio>
#include <memory>
#include <stdexcept>
#include <string>
#include <array>
#include <QDebug>


AppCore::AppCore(QObject *parent) : QObject(parent)
{
//    count = 0;
}

void AppCore::readyReadStandardOutputB(){
    QString s_data = QString::fromLatin1(beforeProcess->readAllStandardOutput());
    std::string output = s_data.toStdString();
    std::cout << output << std::endl;
    emit sendConsoleOutput(s_data);
}

void AppCore::readyReadStandardErrorB(){
    qDebug() << beforeProcess->readAllStandardError();
}

void AppCore::readyReadStandardOutputR(){
    QString s_data = QString::fromLatin1(myProcess->readAllStandardOutput());
    std::string output = s_data.toStdString();
    std::cout << output << std::endl;
    emit sendConsoleOutput(s_data);
}

void AppCore::readyReadStandardErrorR(){
    qDebug() << myProcess->readAllStandardError();
}

void AppCore::readyReadStandardOutputA(){
    QString s_data = QString::fromLatin1(afterProcess->readAllStandardOutput());
    std::string output = s_data.toStdString();
    std::cout << output << std::endl;
    emit sendConsoleOutput(s_data);
}

void AppCore::readyReadStandardErrorA(){
    qDebug() << afterProcess->readAllStandardError();
}

void AppCore::runAction()
{


    if (getBoolValueFromCB("runBef")==1)
        runBefore();
    else
        runRsync();

}



void AppCore::runRsync()
{
    QObject* rootCB = this->parent()->findChild<QObject*>("startAsRoot");
    bool startAsRoot = false;
    if (rootCB != NULL)
           startAsRoot = rootCB->property("checked").toBool() == true;
    QString program = "rsync";
    QStringList arguments;
    //arguments << "-r" << "-t" << "-v" << "--progress" << "-s" << "/home/alexey/1" << "/home/alexey/2";

    // временая заглушка для теста до полной настройки чекбоксов
    arguments << "-r" << "-t" << "-v" << "--progress" << "-s";

    // Получение кодов всех элементов интерфейса, начинающихся с "-" (чекбоксы) с последующим добавлением этих кодов в качестве параметров
    QList<QObject*> list = this->parent()->findChildren<QObject*>(QRegExp("^-"));
    for (QList<QObject*>::iterator i = list.begin(); i != list.end(); i++) {
        if ((*i)->property("checked").toBool() == true) {
//            parameters += (*i)->property("objectName").toString().toStdString() + " ";
            arguments << (*i)->property("objectName").toString();
        }
    }

    QObject* sourceField = this->parent()->findChild<QObject*>("source");
    QObject* destinationField = this->parent()->findChild<QObject*>("destination");

    // Добавляем source и destionation
    arguments << sourceField->property("text").toString();
    arguments << destinationField->property("text").toString();

    if (startAsRoot)
    {
        arguments.push_front(program);
        program = "pkexec";
    }
    myProcess = new QProcess(parent());
    myProcess->start(program, arguments);

    connect(myProcess,SIGNAL(readyReadStandardOutput()),this,SLOT(readyReadStandardOutputR()));
    connect(myProcess,SIGNAL(readyReadStandardError()),this,SLOT(readyReadStandardErrorR()));
    connect(myProcess,SIGNAL(finished(int,QProcess::ExitStatus)),this,SLOT(finishedRsyncProcess(int,QProcess::ExitStatus)));

}


void AppCore::runBefore()
{
    QString program;
    QStringList arguments;
    QString s;
    if (getStringFromTextField("comBef",s)!=0)
        return;
    beforeProcess = new QProcess(parent());
    getProgramArgs(s,program,arguments);
    beforeProcess->start(program, arguments);
    connect(beforeProcess,SIGNAL(readyReadStandardOutput()),this,SLOT(readyReadStandardOutputB()));
    connect(beforeProcess,SIGNAL(readyReadStandardError()),this,SLOT(readyReadStandardErrorB()));
    connect(beforeProcess,SIGNAL(finished(int,QProcess::ExitStatus)),this,SLOT(finishedBeforeProcess(int,QProcess::ExitStatus)));
}

void AppCore::runAfter()
{
    QString program;
    QStringList arguments;
    QString s;
    if (getStringFromTextField("comAft",s)!=0)
        return;
    afterProcess = new QProcess(parent());
    getProgramArgs(s,program,arguments);
    afterProcess->start(program, arguments);
    connect(afterProcess,SIGNAL(readyReadStandardOutput()),this,SLOT(readyReadStandardOutputA()));
    connect(afterProcess,SIGNAL(readyReadStandardError()),this,SLOT(readyReadStandardErrorA()));
    connect(afterProcess,SIGNAL(finished(int,QProcess::ExitStatus)),this,SLOT(finishedAfterProcess(int,QProcess::ExitStatus)));

}

void AppCore::cbClicked()
{
    QObject* fileCB = this->parent()->findChild<QObject*>("syncFiles");
    syncFolders = fileCB->property("checked").toBool() == false;
    QObject* fileDialog = this->parent()->findChild<QObject*>("fileDialogLoad");
    if (fileDialog!= NULL){
        fileDialog->setProperty("selectFolder",syncFolders);
    }
}

bool AppCore::getSyncFolders()
{
    return syncFolders;
}

void AppCore::getProgramArgs(QString input, QString &prog, QStringList &args)
{
    bool flag = true;
    prog = "";
    args.clear();
    QString arg="";
    int i = 0;
    while(input[i]==' ')
        i++;
    for (;i<input.length();i++)
    {
        if (input[i]== ' ')
        {
            if (flag)
            {
                flag = false;
                prog = arg;
            }
            else
            {
                args.append(arg);
            }
            arg = "";
        }
        else
        {
            arg+=input[i];
        }

    }
    if (prog=="")
        prog==arg;
    else args.append(arg);
}

void AppCore::finishedAfterProcess(int exitCode, QProcess::ExitStatus exitStatus)
{

}

void AppCore::finishedRsyncProcess(int exitCode, QProcess::ExitStatus exitStatus)
{
    bool startAfter = getBoolValueFromCB("runAft")==1;
    bool startOnlyError = getBoolValueFromCB("errAft")==1;
    if (startAfter&&(exitCode==0 ||  !startOnlyError))
        runAfter();
}

void AppCore::finishedBeforeProcess(int exitCode, QProcess::ExitStatus exitStatus)
{
    bool noStartRSync = getBoolValueFromCB("errBef")==1;
    if(noStartRSync&&exitCode!=0)
        return;
    runRsync();
}

int AppCore::getStringFromTextField(QString fieldName, QString &res)
{
    QObject* field = this->parent()->findChild<QObject*>(fieldName);
    if (field == NULL)
        return -1;
    res = field->property("text").toString();
    return 0;
}

int AppCore::getBoolValueFromCB(QString CBname)
{
    QObject* CB = this->parent()->findChild<QObject*>(CBname);
    if (CB == NULL)
    {
        return -1;
    }
    if (CB->property("checked").toBool())
        return 1;
    return 0;
}

