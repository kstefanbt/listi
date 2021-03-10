#include "listmodel4.h"
#include "database.h"

ListModel4::ListModel4(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}


QVariant ListModel4::data(const QModelIndex & index, int role) const {

    int columnId = role - Qt::UserRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ListModel4::roleNames() const {

    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[NameRole] = "name";
    roles[LeftRole] = "lefti";
    return roles;
}

void ListModel4::updateModel()
{
    // The update is performed SQL-queries to the database
    this->setQuery("SELECT id, name, left FROM list WHERE left == 0");
}

int ListModel4::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
