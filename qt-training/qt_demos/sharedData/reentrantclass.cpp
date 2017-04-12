#include <QMutexLocker>
#include "reentrantclass.h"

ReentrantClass::ReentrantClass(QObject *parent) :
    QObject(parent), m_counter(0)
{
}

void ReentrantClass::incCounter(int value)
{
    QMutexLocker locker(&m_mutex);
    m_counter += value;
}

void ReentrantClass::decCounter(int value)
{
    QMutexLocker locker(&m_mutex);
    m_counter -= value;
}

int ReentrantClass::counter()
{
    QMutexLocker locker(&m_mutex);
    return m_counter;
}





