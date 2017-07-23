#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick>

#include "inputhandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    inputHandler ih;


    QQmlEngine engine;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("mohsen",&ih);
    QQmlComponent component(&engine,QUrl(QStringLiteral("qrc:/main.qml")));
    QObject *object = component.create();
    ih.setObject(object);



    //QObject *whot = object->findChild<QObject*>("rect");
    //if (whot)
    //object->setProperty("cc",);

    //object->setProperty("cc",55);

   // QQmlEngine engine;

    //engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
