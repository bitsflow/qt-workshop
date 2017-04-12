#ifndef NODE_H
#define NODE_H

#include <QtCore>

class Node
{
public:
    Node(const QString& aText="No Data", Node *aParent=0);
    ~Node();
    QVariant data() const;
public:
    QString text;
    Node *parent;
    QList<Node*> children;

};

#endif // NODE_H
