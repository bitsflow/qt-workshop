#ifndef HELPFILTER_H
#define HELPFILTER_H

#include <QObject>

class QStatusBar;

class HelpFilter : public QObject
{
    Q_OBJECT
public:
    explicit HelpFilter(QStatusBar *bar, const QString &txt, QObject *parent = 0);

protected:
    bool eventFilter(QObject * /*receiver*/, QEvent *event);
    
private:
    QStatusBar* statusBar;
    QString text;
};

#endif // HELPFILTER_H
