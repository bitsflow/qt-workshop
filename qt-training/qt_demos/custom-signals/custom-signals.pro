TEMPLATE = app
SOURCES= main.cpp \
    data.cpp \
    sender.cpp \
    receiver.cpp \
    mythread.cpp

HEADERS += \
    data.h \
    sender.h \
    receiver.h \
    mythread.h

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
