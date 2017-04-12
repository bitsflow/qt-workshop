#include <QGuiApplication>
#include <QtWidgets/QPushButton>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlEngine>

#include "cppperson.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Expose CppPerson type to QML via the Meta-Object system
    // as "Person" in the "People 1.0" module
    qmlRegisterType<CppPerson>("People", 1,0, "Person");

    QQuickView v(QUrl::fromLocalFile("qml/BasicQObject/main.qml"));
    v.show();

    return app.exec();
}
