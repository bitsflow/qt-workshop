#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <QThread>

class Sender;
class Receiver;

class MyThread : public QThread
{
    Q_OBJECT
public:
    explicit MyThread(Sender *senderArg, QObject *parent = 0);
    ~MyThread();

protected:
    void run();

private:
    Sender *m_sender;
};

#endif // MYTHREAD_H
