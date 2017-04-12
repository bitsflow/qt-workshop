#include <QGuiApplication>
#include <QtQuick/QQuickView>
#include <QtQuick/QQuickItem>

int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);

    QQuickView v(QUrl::fromLocalFile("main.qml"));

    // Access the root element in QML (the Rectangle)
    QQuickItem* item = qobject_cast<QQuickItem*>(v.rootObject());
    item->setRotation(45); // Just an example

    // Make QML content size automatically adjust with the view size
    v.setResizeMode(QQuickView::SizeRootObjectToView);

    v.show();

    return a.exec();
}
