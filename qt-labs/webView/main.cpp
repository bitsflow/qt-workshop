#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine/qtwebengineglobal.h>
#include "incubator.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QtWebEngine::initialize();

    Incubator incubator;

    QQmlApplicationEngine engine;
    engine.setIncubationController(&incubator);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

