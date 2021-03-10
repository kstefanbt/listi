#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "database.h"
#include "listmodel1.h"
#include "listmodel2.h"
#include "listmodel3.h"
#include "listmodel4.h"
#include "listmodel5.h"
#include "listmodel6.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    DataBase database;
    database.connectToDataBase();

    ListModel1 *model = new ListModel1();
    ListModel2 *model2 = new ListModel2();
    ListModel3 *model3 = new ListModel3();
    ListModel4 *model4 = new ListModel4();
    ListModel5 *model5 = new ListModel5();
    ListModel6 *model6 = new ListModel6();
    engine.rootContext()->setContextProperty("Model1", model);
    engine.rootContext()->setContextProperty("Model2", model2);
    engine.rootContext()->setContextProperty("Model3", model3);
    engine.rootContext()->setContextProperty("Model4", model4);
    engine.rootContext()->setContextProperty("Model5", model5);
    engine.rootContext()->setContextProperty("Model6", model6);
    engine.rootContext()->setContextProperty("database", &database);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
