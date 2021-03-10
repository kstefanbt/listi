#include "listmodel3.h"
#include "database.h"

ListModel3::ListModel3(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}


QVariant ListModel3::data(const QModelIndex & index, int role) const {

    int columnId = role - Qt::UserRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ListModel3::roleNames() const {

    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[NameRole] = "name";
    roles[CheckedRole] = "checked";
    roles[ListRole] = "list_id";
    return roles;
}


void ListModel3::updateModel()
{
    this->setQuery("SELECT id, name, checked, list_id FROM element WHERE checked = 1 AND list_id IN (SELECT br FROM show WHERE id = 1)");
}

int ListModel3::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
