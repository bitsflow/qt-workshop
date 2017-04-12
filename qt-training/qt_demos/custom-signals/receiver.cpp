#include <QDebug>
#include <QThread>

#include "receiver.h"
#include "data.h"

Receiver::Receiver(QObject *parent) :
    QObject(parent)
{
}

void Receiver::data(const Data &data)
{
    qDebug() << "Receiver says: " << data.m_integer << *data.m_pointer << data.m_string;

#if QT_VERSION < 0x050000
    connect(thread(), SIGNAL(finished()), thread(), SLOT(deleteLater()));
#else
    connect(thread(), &QThread::finished, thread(), &QThread::deleteLater);
#endif
    thread()->quit();
}

