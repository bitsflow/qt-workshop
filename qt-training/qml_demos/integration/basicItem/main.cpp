#include <QGuiApplication>
#include <QtQuick/QQuickView>
#include "piechart.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<PieChart>("Charts", 1, 0, "PieChart");

    QQuickView v(QUrl::fromLocalFile("qml/BasicItem/main.qml"));
    v.show();

    return app.exec();

}
