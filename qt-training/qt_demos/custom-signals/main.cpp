#include <QApplication>
#include <QMetaType>
#include "data.h"
#include "sender.h"
#include "mythread.h"

int main( int argc, char** argv ) {
    QApplication app( argc, argv );

    // qMetaTypeId<Data>();

    Sender sender;
    MyThread *thread = new MyThread(&sender);
    thread->start();

    sender.show();
    return app.exec();
}

