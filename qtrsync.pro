TEMPLATE = app

QT += qml quick quickcontrols2
CONFIG += c++11

SOURCES += main.cpp \
    appcore.cpp \
    session.cpp

lupdate_only {
    SOURCES += ExtendedOptionsTabContent.qml \
        main.qml \
        OptionsTab.qml \
        SourceAndDest.qml \
        AdvancedOptionsTabContent.qml \
        MainOptionsTabContent.qml
}

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    appcore.h \
    translatontest.h \
    session.h

TRANSLATIONS += QmlLanguage_ru.ts

DISTFILES += \
    QmlLanguage_ru.ts
