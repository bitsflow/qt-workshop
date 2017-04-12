#ifndef CUSTOMBUTTON_H
#define CUSTOMBUTTON_H

#include <QPushButton>
#include "reentrantclass.h"

class CustomButton : public QPushButton
{
    Q_OBJECT
public:
    explicit CustomButton(QSharedPointer<ReentrantClass> sharedObject, QWidget *parent = 0);

signals:

public slots:
    void randomSlot();

private:
    QSharedPointer<ReentrantClass> m_sharedObject;

};

#endif // CUSTOMBUTTON_H
