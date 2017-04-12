#include "cppperson.h"

CppPerson::CppPerson(QObject *parent) :
    QObject(parent), m_shoeSize(0)
{
}

QString CppPerson::name() const {
    return m_name;
}

void CppPerson::setName(const QString &name) {
    if (m_name != name) {
        m_name = name;
        emit nameChanged();
    }
}

int CppPerson::shoeSize() const {
    return m_shoeSize;
}

void CppPerson::setShoeSize(int size) {
    if (m_shoeSize != size) {
        m_shoeSize = size;
        emit shoeSizeChanged();
    }
}
