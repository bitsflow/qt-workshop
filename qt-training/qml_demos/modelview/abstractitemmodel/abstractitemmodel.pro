TARGET = abstractitemmodel
QT += qml quick widgets

HEADERS = model.h
SOURCES = main.cpp \
          model.cpp
RESOURCES += abstractitemmodel.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/quick/models/abstractitemmodel
INSTALLS += target
