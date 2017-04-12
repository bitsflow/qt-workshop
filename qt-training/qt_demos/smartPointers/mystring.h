#ifndef MYSTRING_H
#define MYSTRING_H

#include <QString>

class MyString
{
public:
    MyString(const char *str);
    ~MyString();
private:
    QString m_string;
};

#endif // MYSTRING_H
