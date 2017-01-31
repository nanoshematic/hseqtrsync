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

AppCore::AppCore(QObject *parent) : QObject(parent)
{
//    count = 0;
}

//void AppCore::receiveFromQml()
//{
//    count++;
//    emit sendToQml(count);
//}

//execute command
std::string exec(const char* cmd) {
    std::array<char, 128> buffer;
    std::string result;
    std::shared_ptr<FILE> pipe(popen(cmd, "r"), pclose);
    if (!pipe) throw std::runtime_error("popen() failed!");
    while (!feof(pipe.get())) {
        if (fgets(buffer.data(), 128, pipe.get()) != NULL)
            result += buffer.data();
    }
    return result;
}

void AppCore::runAction()
{
//    QObject* cb = this->parent()->findChild<QObject*>("-R");
    QList<QObject*> list = this->parent()->findChildren<QObject*>(QRegExp("^\-"));
    for (QList<QObject*>::iterator i = list.begin(); i != list.end(); i++) {
        if ((*i)->property("checked").toBool() == true) {
            std::cout << (*i)->property("objectName").toString().toStdString() << std::endl;
        }
    }

    std::string res = exec("man rsync");
    std::cout << "123" << res << std::endl;
}
