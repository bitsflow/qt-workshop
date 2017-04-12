#include <QDebug>
#include "mydataset.h"

MyDataSet::MyDataSet(QObject *parent) :
    QObject(parent), m_color(QColor(Qt::lightGray)), m_text("Hi, I'm text from C++!")
{
    startTimer(1000);
}

QColor MyDataSet::backgroundColor() const {
    return m_color;
}

void MyDataSet::setBackgroundColor(const QColor& newColor) {
    if (m_color != newColor) {
        // Update value and notify observers (possibly in QML context)
        m_color = newColor;
        emit myBackgroundColorChanged();
    }
}

QString MyDataSet::text() const {
    return m_text;
}

void MyDataSet::setText(const QString& newText) {
    if (m_text != newText) {
        // Update value and notify observers (possibly in QML context)
        m_text = newText;
        emit myTextChanged();
    }
}

void MyDataSet::timerEvent(QTimerEvent *)
{
    int red(qrand() % 256);
    int green(qrand() % 256);
    int blue(qrand() % 256);
    qDebug() << red << " " << green << " " << blue;
    setBackgroundColor(QColor());
}
