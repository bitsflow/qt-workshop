import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Item {
    property var webViewPage

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
                    stackView.push({item: "qrc:/ImageViewPage.qml"});
                }
            }

            // Page 2 - WebViewPage
            ToolButton {
                iconSource: "qrc:/images/cloud.png"
                onClicked: {
                    stackView.push({item: "qrc:/WebViewPage.qml"});
                }
            }
            // Add images to the C++ model
            ToolButton {
                iconSource: "qrc:/images/download.png"
                onClicked: {
                    fileDialog.open();
                }
            }
        }
        style: ToolBarStyle {
            background: Item {
            }
        }
    }

    Component.onCompleted: {
        var component = Qt.createComponent("qrc:/WebViewPage.qml");
        var incubator = component.incubateObject();
        if (incubator.status !== Component.Ready) {
            incubator.onStatusChanged = function(status) {
                if (status === Component.Ready) {
                    webViewPage = incubator.object;
                }
            }
        } else {
            webViewPage = incubator.object;
        }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose image files"
        folder: shortcuts.home
        onAccepted: {
            for (var i = 0; i < fileUrls.length; ++i) {
                imageModel.addImage(fileUrls[i]);
            }
            notification.show(qsTr("Images added to the model"));
        }
    }

    NotificationMessage {
        id: notification
        anchors.centerIn: parent
        width: parent.width * 0.5
        height: parent.height * 0.5
    }
}

