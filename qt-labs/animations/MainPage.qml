import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Item {
    NotificationMessage {
        anchors.top: parent.top
        anchors.bottom: bottomToolbar.bottom
        width: parent.width
        Component.onCompleted: show("Hello");
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

            // Page 1 - ImageViewPage
            ToolButton {
                iconSource: "qrc:/images/image.png"
                onClicked: {
                    pageStack.push({item: "qrc:/ImageViewPage.qml"});
                }
            }

            // Page 2 - WebViewPage
            ToolButton {
                iconSource: "qrc:/images/cloud.png"
                onClicked: {
                    pageStack.push({item: "qrc:/WebViewPage.qml"});
                }
            }
        }
        style: ToolBarStyle {
            background: Item {
            }
        }
    }
}

