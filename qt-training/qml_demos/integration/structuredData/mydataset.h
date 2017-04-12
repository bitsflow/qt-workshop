#ifndef MYDATASET_H
#define MYDATASET_H

#include <QtCore/QObject>
#include <QtGui/QColor>

class MyDataSet : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QColor myBackgroundColor READ backgroundColor
               WRITE setBackgroundColor NOTIFY myBackgroundColorChanged)
    Q_PROPERTY(QString myText READ text
               WRITE setText NOTIFY myTextChanged)
public:
    explicit MyDataSet(QObject *parent = 0);

    QColor backgroundColor() const;
    void setBackgroundColor(const QColor& newColor);

    QString text() const;
    void setText(const QString& newText);

protected:
    void timerEvent(QTimerEvent *);

signals:
    void myBackgroundColorChanged();
    void myTextChanged();

private:
    QColor m_color;
    QString m_text;

};

#endif // MYDATASET_H
