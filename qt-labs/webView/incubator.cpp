#include "incubator.h"

Incubator::Incubator(QObject *parent) : QObject(parent)
{
    startTimer(16);
}

void Incubator::timerEvent(QTimerEvent *)
{
    incubateFor(5);
}

