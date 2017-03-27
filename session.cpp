#include "session.h"

Session::Session()
{
    rsyncProcess = NULL;
    arguments.clear();
    source = "";
    destination = "";
}

void Session::read(const QJsonObject &json)
{
    arguments = json["arguments"].toString().split(" ");
    source = json["source"].toString();
    destination = json["destination"].toString();
}

void Session::write(QJsonObject &json) const
{
    QString a = "";
    foreach (const QString arg, arguments)
    {
        a.append(arg + " ");
    }
    json["arguments"] = a;
    json["source"] = source;
    json["destination"] = destination;
}
