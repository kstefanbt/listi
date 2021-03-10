#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QtSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>

#define DATABASE_HOSTNAME   "ListHost"
#define DATABASE_NAME       "dalist.db"

#define TABLE                   "list"
#define TABLE_ID                "id"
#define TABLE_NAME              "name"
#define TABLE_LEFT              "left"

#define TABLEE                  "element"
#define TABLEE_ID               "id"
#define TABLEE_NAME             "name"
#define TABLEE_CHECKED          "checked"
#define TABLEE_PID              "list_id"

class DataBase : public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();
    void connectToDataBase();

private:
    QSqlDatabase    db;

private:
    bool openDataBase();
    bool restoreDataBase();
    void closeDataBase();

public slots:
    QString getPath();
    bool removeRecord();
    bool removeRecord2();
    bool removeRecord3(QString str);
    bool updateTableShow(QString str);
    bool updateTableE1(QString str);
    bool updateTableE2(QString str);
    bool updateTableE3();
    bool updateTableLC1();
    bool updateTableLC2();
    bool insertIntoTableL(const QVariantList &data);
    bool insertIntoTableL(const QString &id, const QString &name);
    bool insertIntoTableE(const QVariantList &data);
    bool insertIntoTableE(const QString &id, const QString &name);
};

#endif // DATABASE_H
