#ifndef CPPPERSON_H
#define CPPPERSON_H
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlComponent>

class CppPerson : public QObject
{
     Q_OBJECT
     Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
     Q_PROPERTY(int shoeSize READ shoeSize WRITE setShoeSize NOTIFY shoeSizeChanged)
 public:
     CppPerson(QObject *parent = 0);

     QString name() const;
     void setName(const QString &name);

     int shoeSize() const;
     void setShoeSize(int size);

 signals:
     void nameChanged();
     void shoeSizeChanged();

 private:
     QString m_name;
     int m_shoeSize;
 };

#endif // CPPPERSON_H
