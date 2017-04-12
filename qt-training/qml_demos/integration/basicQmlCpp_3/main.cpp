#include <QGuiApplication>
#include <QtQuick/QQuickView>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);

    QQuickView v(QUrl::fromLocalFile("main.qml"));

    // Expose a QColor and a string to QML using QDeclarativeContext.
    QQmlContext* context = v.rootContext();
    context->setContextProperty("myBackgroundColor", QColor(Qt::lightGray));
    context->setContextProperty("myText", "Hi, I'm text from C++!");

    // Expose the view object so that we can change its title from QML
    // (by calling the base class slot function QWidget::setWindowTitle(...))
    context->setContextProperty("myView", &v);

    // Make QML content size automatically adjust with the view size
    v.setResizeMode(QQuickView::SizeRootObjectToView);

    v.show();

    return a.exec();
}
