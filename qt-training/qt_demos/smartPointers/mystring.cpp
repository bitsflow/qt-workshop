#include "mystring.h"

#include <QDebug>

MyString::MyString(const char *str)
{
    m_string = str;
}

MyString::~MyString()
{
    qDebug() << "MyString(" << m_string <<") is destructed.";
}
