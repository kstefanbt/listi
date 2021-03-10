#include "listmodel6.h"
#include "database.h"

ListModel6::ListModel6(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}


QVariant ListModel6::data(const QModelIndex & index, int role) const {

    int columnId = role - Qt::UserRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ListModel6::roleNames() const {

    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[NameRole] = "name";
    roles[LeftRole] = "lefti";
    return roles;
}

void ListModel6::updateModel()
{
    // The update is performed SQL-queries to the database
    this->setQuery("SELECT id, name,  checked FROM element WHERE list_id IN (SELECT br FROM show WHERE id = 1)");
}

int ListModel6::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
