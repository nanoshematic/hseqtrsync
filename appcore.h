#ifndef APPCORE_H
#define APPCORE_H

#include <QObject>
#include <QString>
#include <QVariant>
#include <string>
#include <QProcess>

class AppCore : public QObject
{
    Q_OBJECT
public:
    explicit AppCore(QObject *parent = 0);
    bool syncFolders = true;
    Q_INVOKABLE bool getSyncFolders();

signals:
    // Сигнал для передачи данных в qml-интерфейс
    void sendConsoleOutput(QString output);

public slots:
    // Слот для приёма данных из qml-интерфейса
    void runAction();
    void readyReadStandardOutputB();
    void readyReadStandardErrorB();
    void readyReadStandardOutputR();
    void readyReadStandardErrorR();
    void readyReadStandardOutputA();
    void readyReadStandardErrorA();

    void finishedBeforeProcess(int exitCode, QProcess::ExitStatus exitStatus);
    void finishedRsyncProcess(int exitCode, QProcess::ExitStatus exitStatus);
    void finishedAfterProcess(int exitCode, QProcess::ExitStatus exitStatus);

    void cbClicked();

private:
    QProcess *beforeProcess = NULL, *myProcess = NULL, *afterProcess = NULL;
    bool startBeforeProcess = false, startAfterProcess = false;
    void getProgramArgs(QString input, QString &prog, QStringList &args);
    int getStringFromTextField(QString fieldName, QString &res);
    int getBoolValueFromCB(QString CBname);
    void runRsync();
    void runBefore();
    void runAfter();
//    int count;  // Счетчик, которым будем оперировать
};

#endif // APPCORE_H
