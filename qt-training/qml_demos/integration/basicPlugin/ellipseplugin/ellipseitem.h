/*************************************************************************
 *
 * Copyright (c) 2012, Digia Plc.
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#ifndef ELLIPSEITEM_H
#define ELLIPSEITEM_H

#include <QQuickPaintedItem>

class EllipseItem : public QQuickPaintedItem
{
    Q_OBJECT

public:
    EllipseItem(QQuickItem *parent = 0);
    void paint(QPainter *painter);
};

#endif
