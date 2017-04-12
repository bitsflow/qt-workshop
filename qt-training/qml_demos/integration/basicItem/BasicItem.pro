QT       += qml quick

TARGET = BasicItem
TEMPLATE = app

OTHER_FILES += \
    main.qml \
    qml/BasicItem/main.qml

SOURCES += main.cpp \
    piechart.cpp

HEADERS += \
    piechart.h
