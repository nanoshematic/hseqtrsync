#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <appcore.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
//    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    AppCore appCore;
    context->setContextProperty("appCore", &appCore);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject* root = engine.rootObjects()[0];
    appCore.setParent(root);

    return app.exec();
}
