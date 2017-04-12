#include <QGuiApplication>
#include <QtQuick/QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);

    QQuickView v(QUrl::fromLocalFile("main.qml"));
    v.show();

    return a.exec();
}
