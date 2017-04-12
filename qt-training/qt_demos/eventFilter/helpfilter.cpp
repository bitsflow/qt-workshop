#include <QStatusBar>
#include <QEvent>
#include "helpfilter.h"

HelpFilter::HelpFilter(QStatusBar *bar, const QString &txt, QObject *parent) :
    QObject(parent), statusBar(bar), text(txt)
{
}

bool HelpFilter::eventFilter(QObject *, QEvent *event)
{
    if (event->type() == QEvent::Enter) {
        statusBar->showMessage(text, 5000);
    }
    else if (event->type() == QEvent::Leave) {
        statusBar->clearMessage();
    }

    return false;
}
