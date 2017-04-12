#include <QEvent>
#include <QApplication>
#include <QMouseEvent>

#include "masterbutton.h"

MasterButton::MasterButton(QString txt, QPushButton *slaveButton, QPushButton *parent) :
    QPushButton(txt, parent), slave(slaveButton)
{
}

bool MasterButton::event(QEvent *event)
{
    if (QEvent::MouseButtonPress <= event->type() && event->type() <= QEvent::KeyRelease)
        qApp->sendEvent(slave, event);
    return QPushButton::event(event);
}

