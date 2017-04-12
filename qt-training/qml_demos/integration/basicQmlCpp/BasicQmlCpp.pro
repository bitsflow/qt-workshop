QT       += qml quick

TARGET = BasicQmlCpp
TEMPLATE = app

SOURCES += main.cpp

OTHER_FILES += \
    main.qml

CONFIG -= declarative_debug
CONFIG += qml_debug

