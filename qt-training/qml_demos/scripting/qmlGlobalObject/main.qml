import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("QML Global Object")
    id: root
    width: 400; height: 200
    visible: true
    color: "gray"

    Item {
        width: myText.width; height: parent.height
        Text {
            anchors.centerIn: parent
            id: myText
            color: Qt.rgba(255, 0, 0, 1)
            text: Qt.md5("Click to darken/lighten my color")
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: {
                    var date = new Date();
                    console.log(date.toUTCString());

                    if (mouse.button == Qt.LeftButton)
                        myText.color = Qt.darker(myText.color);
                    else
                        myText.color = Qt.lighter(myText.color);
                }
            }
        }
    }
}
