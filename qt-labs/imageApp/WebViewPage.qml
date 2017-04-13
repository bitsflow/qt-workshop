import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtWebEngine 1.0

Item {
    RowLayout {
        id: rowLayout
        width: parent.width
        anchors.top: parent.top
        Rectangle {
            Layout.fillWidth: true
            height: button.height
            TextInput {
                id: textInput
                anchors.fill: parent
                text: qsTr("http://")
                focus: true
                font.pixelSize: 20
                onAccepted: webview.url = text;
            }
        }
        Button {
            id: button
            text: qsTr("Back")
            onClicked: webview.goBack();
        }
    }
    WebEngineView {
        id: webview
        anchors.top: rowLayout.bottom
        anchors.bottom: bottomToolbar.top
        width: parent.width
        url: "http://qt.io"
    }

    ToolBar {
        id: bottomToolbar
        anchors.bottom: parent.bottom
        anchors.bottomMargin: scale * bottomMargin
        width: parent.width
        scale: (Qt.platform.os === "android" || Qt.platform.os === "ios") ? 2.0 : 1.0

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: columnSpacing
            ToolButton {
                iconSource: "qrc:/images/arrow_left.png"
                onClicked: {
                    stackView.pop();
                }
            }
        }
        style: ToolBarStyle {
            background: Item {
            }
        }
    }
}

