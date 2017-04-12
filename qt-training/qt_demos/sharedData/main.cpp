#include <QApplication>
#include <QSharedPointer>
#include "reentrantclass.h"
#include "mythread.h"
#include "custombutton.h"

int main(int argc, char *argv[])
{
    QApplication application(argc, argv);

    QSharedPointer<ReentrantClass> sharedObject(new ReentrantClass);
    QSharedPointer<ReentrantClass> sharedObject1(sharedObject);

    CustomButton button(sharedObject1);

    MyThread thread(sharedObject);
    thread.start();

    button.show();


    return application.exec();
}
