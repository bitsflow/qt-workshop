#ifndef INCUBATOR_H
#define INCUBATOR_H

#include <QObject>
#include <QQmlIncubationController>

class Incubator : public QObject, public QQmlIncubationController
{
    Q_OBJECT
public:
    explicit Incubator(QObject *parent = 0);

protected:
    void timerEvent(QTimerEvent *) Q_DECL_OVERRIDE;
};

#endif // INCUBATOR_H
