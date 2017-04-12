#include <QDebug>

#include "mythread.h"
#include "sender.h"
#include "receiver.h"
#include "data.h"

MyThread::MyThread(Sender *senderArg, QObject *parent) :
    QThread(parent), m_sender(senderArg)
{
    // Anything created here is on the thread creating the MyThread instance, not on the MyThread thread!
    setObjectName("Child thread");
}

MyThread::~MyThread()
{
    qDebug() << "Thread " + objectName() + " destructor called.";
}

void MyThread::run()
{
    QScopedPointer<Receiver> receiver(new Receiver());
#if QT_VERSION < 0x050000
    connect(m_sender, SIGNAL(data(Data)), receiver, SLOT(data(Data)), Qt::QueuedConnection);
#else
    connect(m_sender, &Sender::data, receiver.data(), &Receiver::data);
#endif
    exec();
}


