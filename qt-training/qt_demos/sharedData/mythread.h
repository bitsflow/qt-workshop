#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <QThread>
#include <QSharedPointer>

class ReentrantClass;
class MyThread : public QThread
{
    Q_OBJECT
public:
    explicit MyThread(QSharedPointer<ReentrantClass> sharedObject, QObject *parent = 0);

protected:
    void run();

signals:

public slots:
private:
    QSharedPointer<ReentrantClass> m_sharedObject;

};

#endif // MYTHREAD_H
