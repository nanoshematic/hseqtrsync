#ifndef APPCORE_H
#define APPCORE_H

#include <QObject>
#include <QString>
#include <QVariant>
#include <string>

class AppCore : public QObject
{
    Q_OBJECT
public:
    explicit AppCore(QObject *parent = 0);

signals:
    // Сигнал для передачи данных в qml-интерфейс
    void sendConsoleOutput(QString output);

public slots:
    // Слот для приёма данных из qml-интерфейса
    void runAction();
    void readyReadStandardOutput();
    void readyReadStandardError();

private:
//    int count;  // Счетчик, которым будем оперировать
};

#endif // APPCORE_H
