#include "node.h"

Node::Node(const QString& aText, Node *aParent)
    : text(aText), parent(aParent)
{
    if(parent) {
        parent->children.append(this);
    }
}

Node::~Node()
{
    qDeleteAll(children);
}

QVariant Node::data() const {
    return text;
}
