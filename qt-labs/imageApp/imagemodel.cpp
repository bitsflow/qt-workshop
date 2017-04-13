#include "imagemodel.h"

ImageModel::ImageModel(QObject *parent) : QAbstractListModel(parent)
{
}

void ImageModel::addImage(QString fileId)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_images << fileId;
    endInsertRows();
}

int ImageModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_images.count();
}

QVariant ImageModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_images.count())
        return QVariant();

    if (role == FileIdRole)
        return m_images[index.row()];

    return QVariant();
}

QHash<int, QByteArray> ImageModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[FileIdRole] = "fileId";
    return roles;
}
