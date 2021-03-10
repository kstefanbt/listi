#include "listmodel1.h"
#include "database.h"

ListModel1::ListModel1(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}


QVariant ListModel1::data(const QModelIndex & index, int role) const {

    int columnId = role - Qt::UserRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ListModel1::roleNames() const {

    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[NameRole] = "name";
    roles[LeftRole] = "lefti";
    return roles;
}

void ListModel1::updateModel()
{
    // The update is performed SQL-queries to the database
    this->setQuery("SELECT id, name, left FROM list WHERE left <> 0");
}

int ListModel1::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
