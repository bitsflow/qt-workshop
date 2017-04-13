import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Particles 2.0

Item {
    property string fileId
    property bool blurEffectOn: false

    onFileIdChanged: {
        image.source = useEnginio ? "" : fileId
        if (useEnginio) {
            // Download the full image, not the thumbnail
            var data = { "id": fileId }
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
                iconSource: "qrc:/images/star.png"
                onClicked: {
                    if (blurEffectOn) {
                        blur.visible = false;
                        blurEffectOn = false;
                    }
                    else {
                        blur.visible = true;
                        blurEffectOn = true;
                    }
                }
            }
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

    ZoomBlur {
        id: blur
        anchors.fill: image
        source: image
        visible: false
        samples: 24
        length: 48
        PinchArea {
            anchors.fill: blur
            onPinchUpdated: {
                blur.scale = pinch.scale;
                blur.rotation = pinch.rotation;
            }
        }
    }

    MouseArea {
        anchors.top: parent.top
        anchors.bottom: bottomToolbar.top
        width: parent.width
        id: mouse
        onPositionChanged: {
            emitter1.x = mouse.x
            emitter1.y = mouse.y
        }

        ParticleSystem {
            id: par
            anchors.fill: parent
            Emitter {
                id: emitter1
                width: 10
                height: 10
                enabled: mouse.pressed
                emitRate: 500
                lifeSpan: 1500
            }
            ImageParticle {
                source: "qrc:/images/blueStar.png"
                alpha: 0
                colorVariation: 1.0
            }
        }
    }
}

