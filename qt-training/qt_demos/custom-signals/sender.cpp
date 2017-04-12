#include "sender.h"
#include "data.h"

Sender::Sender(QWidget *parent) :
    QPushButton("Push me", parent)
{
#if QT_VERSION < 0x050000
    connect(this, SIGNAL(clicked()), this, SLOT(sendData()));
#else
    connect(this, &Sender::clicked, this, &Sender::sendData);
#endif

    m_integer = 42;
    setMinimumSize(200, 30);
}

void Sender::sendData()
{
    Data d(10, &m_integer, "hello");
    emit data(d);
}

