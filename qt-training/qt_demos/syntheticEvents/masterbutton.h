#ifndef MASTERBUTTON_H
#define MASTERBUTTON_H

#include <QPushButton>

class MasterButton : public QPushButton
{
    Q_OBJECT
public:
    explicit MasterButton(QString txt, QPushButton *slaveButton, QPushButton *parent = 0);

protected:
    bool event(QEvent *event);

private:
    QPushButton* slave;
};

#endif // MASTERBUTTON_H
