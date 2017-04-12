#include <QGuiApplication>
#include <QtQuick/QQuickView>
#include <QtQuick/QQuickItem>
#include <QQmlContext>
#include <QtCore/QTimer>

int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);

    QQuickView v;

    QColor color(Qt::lightGray);

    // Expose a QColor and a string to QML using QDeclarativeContext.
    QQmlContext* context = v.rootContext();
    context->setContextProperty("myBackgroundColor", color);
    context->setContextProperty("myText", "Hi, I'm text from C++!");

    // Expose the view object so that we can change its title from QML
    // (by calling the base class slot function QWidget::setWindowTitle(...))
    context->setContextProperty("myView", &v);

    v.setSource(QUrl::fromLocalFile("main.qml"));

    // Call a QML method directly using QMetaObject...
    QQuickItem* item = qobject_cast<QQuickItem*>(v.rootObject());
    QMetaObject::invokeMethod(item, "toggleText");

    color.setRgb(1.0, 0.0, 0.0);

    // ...or by connecting a signal to it (in this case from a timer, could be any
    // custom signal as well)
    QTimer t;
    QObject::connect(&t, SIGNAL(timeout()), item, SLOT(toggleText()));
    t.setInterval(1000);
    t.start();

    // Make QML content size automatically adjust with the view size
    v.setResizeMode(QQuickView::SizeRootObjectToView);

    v.show();

    return a.exec();
}
