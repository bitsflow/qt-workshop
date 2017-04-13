#include <QApplication>
#include <QtQuick>
#include <QQmlApplicationEngine>
#include <QtWebEngine/qtwebengineglobal.h>
#include "imagemodel.h"
#include "incubator.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QtWebEngine::initialize();

    qmlRegisterType<ImageModel>("ImageModule", 1, 0, "ImageModel");
    Incubator incubator;

    QQmlApplicationEngine engine;
    engine.setIncubationController(&incubator);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

