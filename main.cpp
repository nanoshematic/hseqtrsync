#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <appcore.h>
#include "translatontest.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    TranslationTest myObj;

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    AppCore appCore;
    context->setContextProperty("rootItem", (QObject*)&myObj);
    context->setContextProperty("appCore", &appCore);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject* root = engine.rootObjects()[0];
    appCore.setParent(root);

    myObj.selectLanguage("ru");

    return app.exec();
}
