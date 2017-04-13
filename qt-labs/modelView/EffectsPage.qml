import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Item {
    property string fileId

    onFileIdChanged: {
        image.source = useEnginio ? "" : fileId
        if (useEnginio) {
            // Download the full image, not the thumbnail
            var data = { "id": fileId }
            console.log("Data", data);
            var reply = enginioClient.downloadUrl(data)
            reply.finished.connect(function() {
                image.source = reply.data.expiringUrl
            })
        }
    }

    Label {
        id: label
        text: qsTr("Loading ...")
        font.pixelSize: 28
        color: "white"
        anchors.centerIn: parent
        visible: image.status != Image.Ready
    }

    Image {
        id: image
        anchors.top: parent.top
        anchors.bottom: bottomToolbar.top
        anchors.margins: 10
        anchors.horizontalCenter: parent.horizontalCenter
        smooth: true
        cache: false
        fillMode: Image.PreserveAspectFit
        Behavior on opacity { NumberAnimation { duration: 100 } }
        opacity: image.status === Image.Ready ? 1 : 0
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

