TEMPLATE=app
SOURCES = main.cpp \ 
    masterbutton.cpp

HEADERS += \
    masterbutton.h

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
