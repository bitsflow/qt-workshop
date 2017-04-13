TEMPLATE = app

QT += qml quick widgets webengine

SOURCES += main.cpp \
    imagemodel.cpp \
    incubator.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    imagemodel.h \
    incubator.h

