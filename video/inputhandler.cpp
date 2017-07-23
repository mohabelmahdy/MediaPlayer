#include "inputhandler.h"
#include<qdebug.h>


inputHandler::inputHandler(QObject *parent) : QObject(parent)
{

}

void inputHandler:: setVolume(int volume){
    m=volume;
    o->setProperty("cc",volume);
}

void inputHandler:: setObject(QObject *obj){
    o=obj;
}
int inputHandler:: getVolume(){
    return m;
}
