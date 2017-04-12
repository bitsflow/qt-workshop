#include <QDebug>
#include "custombutton.h"

CustomButton::CustomButton(QSharedPointer<ReentrantClass> sharedObject, QWidget *parent) :
    QPushButton("Press me please", parent), m_sharedObject(sharedObject)
{
    connect(this, SIGNAL(clicked()), this, SLOT(randomSlot()));
}


void CustomButton::randomSlot()
{
    m_sharedObject.data()->incCounter(2);
    qDebug() << "Shared value is " << m_sharedObject.data()->counter();

}
