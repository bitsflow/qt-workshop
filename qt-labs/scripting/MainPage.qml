import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Item {
    property var webViewPage
    id: root
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
                    stackView.push({item: webViewPage});
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
}

