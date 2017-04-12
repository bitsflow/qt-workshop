import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {
        anchors.fill: parent
        button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
        button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))
        button3.onClicked: messageDialog.show(qsTr("Button 3 pressed"))
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
    toolBar: ToolBar {
        id: toolBar
        RowLayout {
            id: buttonLayout
            Instantiator {
                id: instantiator
                model: toolButtonModel
                ToolButton {
                    parent: buttonLayout
                    text: buttonName
                    onClicked: {
                        if (index === 0)
                            toolButtonModel.append({"buttonName": "Btn " + instantiator.count});
                        else if (index === 1)
                            toolButtonModel.remove(instantiator.count - 1, 1);
                        else
                            console.log("Btn",index,"pressed");
                    }
                }
                onObjectAdded: {
                    // Change item properties
                }
            }
        }
    }

    ListModel {
        id: toolButtonModel
        ListElement {
            buttonName: "Add btn"
        }
        ListElement {
            buttonName: "Remove btn"
        }
    }
}
