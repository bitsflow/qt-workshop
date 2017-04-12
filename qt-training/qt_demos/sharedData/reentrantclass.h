#ifndef REENTRANTCLASS_H
#define REENTRANTCLASS_H

#include <QObject>
#include <QMutex>

class ReentrantClass : public QObject
{
    Q_OBJECT
public:
    explicit ReentrantClass(QObject *parent = 0);
    void incCounter(int value);
    void decCounter(int value);
    int counter();

signals:

public slots:

private:
    volatile int m_counter;
    QMutex m_mutex;

};

#endif // REENTRANTCLASS_H
