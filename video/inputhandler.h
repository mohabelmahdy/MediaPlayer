#ifndef INPUTHANDLER_H
#define INPUTHANDLER_H

#include <QObject>

class inputHandler : public QObject
{
    Q_OBJECT
public:
    explicit inputHandler(QObject *parent = nullptr);
    int m;
    QObject *o;
signals:

public slots:
    void setVolume(int volume);
    void setObject(QObject *obj);
    int getVolume();
};

#endif // INPUTHANDLER_H
