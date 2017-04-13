#ifndef IMAGEMODEL_H
#define IMAGEMODEL_H

#include <QAbstractListModel>

class ImageModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum ImageRoles {
        FileIdRole = Qt::UserRole + 1
    };
    explicit ImageModel(QObject *parent = 0);
    int rowCount(const QModelIndex & parent = QModelIndex()) const Q_DECL_OVERRIDE;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

public Q_SLOTS:
    void addImage(QString fileId);

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QStringList m_images;
};

#endif // IMAGEMODEL_H
