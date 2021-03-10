#include "database.h"

DataBase::DataBase(QObject *parent) : QObject(parent)
{

}

DataBase::~DataBase()
{

}

void DataBase::connectToDataBase()
{
    this->openDataBase();

}

bool DataBase::openDataBase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    QDir dire = QDir::currentPath();
    dire.cdUp();
    QString path = dire.absolutePath() + "/listi/dalist.db";
    qDebug() << path;
    //QFileInfo file("/");
    db.setHostName(DATABASE_HOSTNAME);


    db.setDatabaseName(path);
    if(db.open()){
        return true;
    } else {
        return false;
    }
}

void DataBase::closeDataBase()
{
    db.close();
}

bool DataBase::updateTableShow(QString str)
{
    QSqlQuery query;
qDebug() << str;
    query.prepare("UPDATE show SET br=(SELECT id FROM list WHERE name = :br )");
    query.bindValue(":br", str);

    if(!query.exec()){
        qDebug() << "error update s" << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::removeRecord()
{
    QSqlQuery query;
    query.prepare("DELETE FROM list WHERE id IN (SELECT br FROM show WHERE id = 1);");
    query.exec();

    if(!query.exec()){
        qDebug() << "error delete row " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::removeRecord2()
{
    QSqlQuery query;
    query.prepare("DELETE FROM element WHERE list_id IN (SELECT br FROM show WHERE id = 1);");
    query.exec();

    if(!query.exec()){
        qDebug() << "error delete row " << TABLEE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::removeRecord3(QString str)
{
    QSqlQuery query;
    query.prepare("DELETE FROM element WHERE name = :str");
    query.bindValue(":str",str);
    query.exec();

    if(!query.exec()){
        qDebug() << "error delete row " << TABLEE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::insertIntoTableL(const QVariantList &data)
{
    QSqlQuery query;
    query.prepare("INSERT INTO " TABLE " ( " TABLE_ID ", "
                                             TABLE_NAME ", "
                                             TABLE_LEFT " ) "
                  "VALUES (:id, :name, :left)");
    query.bindValue(":id",       data[0].toString());
    query.bindValue(":name",       data[1].toString());
    query.bindValue(":left",         data[2].toString());

    if(!query.exec()){
        qDebug() << "error insert into " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::insertIntoTableL(const QString &id, const QString &name)
{
    QVariantList data;
    data.append(id);
    data.append(name);
    data.append(0);

    if(insertIntoTableL(data))
        return true;
    else
        return false;
}

bool DataBase::insertIntoTableE(const QVariantList &data)
{
    QSqlQuery query;
    query.prepare("INSERT INTO " TABLEE " ( " TABLEE_ID ", "
                                             TABLEE_NAME ", "
                                             TABLEE_CHECKED ", "
                                             TABLEE_PID " ) "
                  "VALUES (:id, :name, :checked, :list_id)");
    query.bindValue(":id",       data[0].toString());
    query.bindValue(":name",       data[1].toString());
    query.bindValue(":checked",         data[2].toString());
    query.bindValue(":list_id",         data[3].toString());

    if(!query.exec()){
        qDebug() << "error insert into " << TABLEE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::insertIntoTableE(const QString &id, const QString &name)
{
    QVariantList data;
    data.append(id);
    data.append(name);
    data.append("0");
    data.append("111");

    if(insertIntoTableE(data))
        return true;
    else
        return false;
}

bool DataBase::updateTableE1(QString str)
{
    QSqlQuery query;

    query.prepare("UPDATE element SET checked = 1 WHERE id = (SELECT id FROM element WHERE name = :br )");
    query.bindValue(":br", str);

    if(!query.exec()){
        qDebug() << "error delete row " << TABLEE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::updateTableE2(QString str)
{
    QSqlQuery query;

    query.prepare("UPDATE element SET checked = 0 WHERE id = (SELECT id FROM element WHERE name = :br )");
    query.bindValue(":br", str);

    if(!query.exec()){
        qDebug() << "error delete row " << TABLEE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::updateTableE3()
{
    QSqlQuery query;

    query.prepare("UPDATE element SET list_id = (SELECT br FROM show WHERE id = 1) WHERE list_id=111");

    if(!query.exec()){
        qDebug() << "error delete row " << TABLEE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::updateTableLC1()
{
    QSqlQuery query;

    query.prepare("UPDATE list SET left = ((SELECT left from list WHERE id IN (SELECT br FROM show WHERE id = 1 )) - 1) WHERE id IN (SELECT br FROM show WHERE id = 1 )");

    if(!query.exec()){
        qDebug() << "error delete row " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::updateTableLC2()
{
    QSqlQuery query;

    query.prepare("UPDATE list SET left = ((SELECT left from list WHERE id IN (SELECT br FROM show WHERE id = 1 )) + 1) WHERE id IN (SELECT br FROM show WHERE id = 1 )");

    if(!query.exec()){
        qDebug() << "error delete row " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

QString DataBase::getPath(){
    QDir dire = QDir::currentPath();
    dire.cdUp();
    QString path = "file:///" + dire.absolutePath() + "/listi/";
    return path;
}
