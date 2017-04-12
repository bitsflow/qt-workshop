#ifndef BLUERAYMODEL_H
#define BLUERAYMODEL_H

#include <QAbstractListModel>
#include <QtCore>

class BlueRay
{
public:
    BlueRay(const QString &name, const QString &image, int year, qreal rating, const QString& director, const QString& cast, const QString& overview, bool ordered = false);
    QString name() const;
    QString image() const;
    int year() const;
    qreal rating() const;
    QString director() const;
    QString cast() const;
    QString overview() const;
    bool ordered() const;
    void setOrdered(bool ordered) {
        m_ordered=ordered;
    }

private:
    QString m_name;
    QString m_image;
    int m_year;
    qreal m_rating;
    QString m_director;
    QString m_cast;
    QString m_overview;
    bool m_ordered;
};

class BlueRayModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum BlueRayRoles {
        NameRole = Qt::UserRole + 1,
        ImageRole,
        YearRole,
        RatingRole,
        DirectorRole,
        CastRole,
        OverviewRole,
        OrderRole
    };

    explicit BlueRayModel(QObject *parent = 0);

    void addBlueRay(const BlueRay &blueRay);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    Q_INVOKABLE QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    Q_INVOKABLE bool setData(const QModelIndex & index, const QVariant& value, int role = Qt::DisplayRole);

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<BlueRay> m_bluerays;
};

#endif // BLUERAYMODEL_H
