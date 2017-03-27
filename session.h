#ifndef SESSION_H
#define SESSION_H
#include <QProcess>
#include <QJsonObject>

class Session
{
public:
    Session();
    QProcess* rsyncProcess;
    QString name;
    QString source;
    QString destination;
    QStringList arguments;

    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;
};

#endif // SESSION_H
