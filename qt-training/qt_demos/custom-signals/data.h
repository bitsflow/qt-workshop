#ifndef DATA_H
#define DATA_H

#include <QObject>
class QString;

class Data
{
public:
    Data();
    Data(int integerArg, int* pointerArg, const QString& stringArg);

    int m_integer;
    int* m_pointer;
    QString m_string;
};

Q_DECLARE_METATYPE(Data)

#endif // DATA_H
