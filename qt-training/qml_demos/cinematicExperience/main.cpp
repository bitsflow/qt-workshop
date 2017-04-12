#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "blueraymodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    BlueRayModel model;
    model.addBlueRay(BlueRay("Fight Club","9.png",1999,8.9,"David Fincher","Brad Pitt, Edward Norton, Helena Bonham Carter","Long long blabla"));
    model.addBlueRay(BlueRay("Thor","19.png",2011,7.0, "Kenneth Branagh","Chris Hemsworth, Anthony Hopkins, Natalie Portman","Long long blabla"));
    model.addBlueRay(BlueRay("Quantum of Solace","4.png",2008,6.8, "Marc Forster","Daniel Craig, Olga Kurylenko, Mathieu Amalric","Long long blabla"));

    QQmlApplicationEngine engine;
    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("blueRayModel", &model);

    engine.load(QUrl(QStringLiteral("qrc:/content/main.qml")));
    return app.exec();
}
