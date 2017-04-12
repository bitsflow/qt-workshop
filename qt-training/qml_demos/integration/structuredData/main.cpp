#include <QGuiApplication>
#include <QtQuick/QQuickView>
#include <QQmlContext>
#include "mydataset.h"

int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);

    QQuickView v;

    // Expose a context object to QML
    QQmlContext* context = v.rootContext();
    context->setContextObject(new MyDataSet(&v));

    v.setSource(QUrl("qrc:///main.qml"));

    // Make QML content size automatically adjust with the view size
    v.setResizeMode(QQuickView::SizeRootObjectToView);

    v.show();

    return a.exec();
}
