#include <QDebug>
#include "mythread.h"
#include "reentrantclass.h"

MyThread::MyThread(QSharedPointer<ReentrantClass> sharedObject, QObject *parent) :
    QThread(parent), m_sharedObject(sharedObject)
{
}

void MyThread::run()
{
    Q_FOREVER {
        m_sharedObject.data()->incCounter(5);
        m_sharedObject.data()->incCounter(3);
        m_sharedObject.data()->decCounter(8);
        if (m_sharedObject.data()->counter() > 10)
            break;
    }
    qDebug() << "Worker dies";
}
