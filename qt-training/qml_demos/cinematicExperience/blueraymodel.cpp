#include "blueraymodel.h"
#include <QDebug>

BlueRay::BlueRay(const QString &name, const QString &image, int year, qreal rating, const QString& director, const QString& cast, const QString& overview, bool ordered)
    : m_name(name), m_image(image), m_year(year), m_rating(rating), m_director(director), m_cast(cast), m_overview(overview), m_ordered(ordered)
{
}

QString BlueRay::name() const
{
    return m_name;
}

QString BlueRay::image() const
{
    return m_image;
}

int BlueRay::year() const
{
    return m_year;
}

qreal BlueRay::rating() const
{
    return m_rating;
}

QString BlueRay::director() const
{
    return m_director;
}

QString BlueRay::cast() const
{
    return m_cast;
}

QString BlueRay::overview() const
{
    return m_overview;
}

bool BlueRay::ordered() const
{
    return m_ordered;
}


BlueRayModel::BlueRayModel(QObject *parent) :
    QAbstractListModel(parent)
{
}

void BlueRayModel::addBlueRay(const BlueRay &blueRay)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_bluerays.append(blueRay);
    endInsertRows();
}

int BlueRayModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent)
    return m_bluerays.count();
}

QVariant BlueRayModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_bluerays.count())
        return QVariant();

    const BlueRay &blueray = m_bluerays[index.row()];
    if (role == NameRole)
        return blueray.name();
    else if (role == ImageRole)
        return blueray.image();
    else if (role == YearRole)
        return blueray.year();
    else if (role == RatingRole)
        return blueray.rating();
    else if (role == DirectorRole)
        return blueray.director();
    else if (role == CastRole)
        return blueray.cast();
    else if (role == OverviewRole)
        return blueray.overview();
    else if (role == OrderRole)
        return blueray.ordered();
    return QVariant();
}

bool BlueRayModel::setData(const QModelIndex & index, const QVariant& value, int role) {
    if (index.row() < 0 || index.row() >= m_bluerays.count())
        return false;

    if (role == OrderRole) {
        m_bluerays[index.row()].setOrdered(value.toBool());
        emit dataChanged(index,index);
        return true;
    }
    else {
        return false;
    }
}

//![0]
QHash<int, QByteArray> BlueRayModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[ImageRole] = "image";
    roles[YearRole] = "year";
    roles[RatingRole] = "rating";
    roles[DirectorRole] = "director";
    roles[CastRole] = "cast";
    roles[OverviewRole] = "overview";
    roles[OrderRole] = "ordered";
    return roles;
}
