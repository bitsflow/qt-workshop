QT       += qml quick widgets

TARGET = BasicQmlCpp
TEMPLATE = app

SOURCES += main.cpp \
    cppperson.cpp

OTHER_FILES += \
    main.qml \
    BasicQObject.svg \
    BasicQObject.png

HEADERS += \
    cppperson.h

