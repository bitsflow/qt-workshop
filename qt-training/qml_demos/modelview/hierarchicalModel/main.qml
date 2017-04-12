import QtQuick 2.4
import QtQuick.Window 2.2
import QtQml.Models 2.1

Window {
    width: 640
    height: 480
    title: qsTr("Delegate Model")
    color: "white"
    visible: true

    property int level: 0

    ListView {
        id: view
        anchors.fill: parent

        model: DelegateModel {
            model: delegateModel

            delegate: Rectangle {
                width: 200
                height: 25
                Row {
                    spacing: 10
                    Text { text: nodeName }
                    // Text { text: qsTr("Dummy Column") }
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton | Qt.LeftButton
                    onClicked: {
                        if (mouse.button === Qt.LeftButton) {
                            if (model.hasModelChildren) {
                                ++level;
                                view.model.rootIndex = view.model.modelIndex(index);
                            }
                        }
                        else if (mouse.button === Qt.RightButton) {
                            if (level > 0) {
                                --level;
                                view.model.rootIndex = view.model.parentModelIndex(index);
                            }
                        }
                    }
                }
            }
        }
    }
}
