import QtQuick 2.3

Rectangle {
    property var hello

    Connections {
        target: hello
        onCustomItem1Signal: console.log("Signal received");
    }
}
