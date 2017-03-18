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
#include <QProcess>
#include <QDebug>


AppCore::AppCore(QObject *parent) : QObject(parent)
{
//    count = 0;
}

QProcess *myProcess;

void AppCore::readyReadStandardOutput(){
    QString s_data = QString::fromLatin1(myProcess->readAllStandardOutput());
    std::string output = s_data.toStdString();
    std::cout << output << std::endl;
    emit sendConsoleOutput(s_data);
}

void AppCore::readyReadStandardError(){
    qDebug() << myProcess->readAllStandardError();
}

void AppCore::runAction()
{
    QObject* rootCB = this->parent()->findChild<QObject*>("startAsRoot");
    bool startAsRoot = false;
    if (rootCB != NULL)
           startAsRoot = rootCB->property("checked").toBool() == true;

    QString program = "rsync";
    QStringList arguments;
    //arguments << "-r" << "-t" << "-v" << "--progress" << "-s" << "/home/alexey/1" << "/home/alexey/2";

    // временая заглушка для теста до полной настройки чекбоксов
    //arguments << "-r" << "-t" << "-v" << "--progress" << "-s";

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
    qDebug() << program;

    connect(myProcess,SIGNAL(readyReadStandardOutput()),this,SLOT(readyReadStandardOutput()));
    connect(myProcess,SIGNAL(readyReadStandardError()),this,SLOT(readyReadStandardError()));


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
