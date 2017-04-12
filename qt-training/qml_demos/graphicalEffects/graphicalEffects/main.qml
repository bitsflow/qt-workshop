import QtQuick 2.4
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Window {
    id: root
    visible: true
    width: 480; height: 360
    property int gridSpacing: 2

    Grid {
        spacing: gridSpacing
        columns: 4
        Item {
            width: root.width / parent.columns - gridSpacing
            height: width
            Image {
                id: blendSrc
                source: "qrc:/images/clarice_the_bear.gif"
                visible: false
            }

            Rectangle {
                id: linearGradient
                visible: false
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "#ffffff"
                    }
                    GradientStop {
                        position: 1.00;
                        color: "#000000";
                    }
                }
                anchors.fill: parent
                opacity: 0.78
            }
            Blend {
                anchors.fill: parent
                source: blendSrc
                foregroundSource: linearGradient
                mode: "subtract"
            }
        }
        Image {
            id: colorizeSrc
            width: root.width / parent.columns - gridSpacing
            height: width
            source: "qrc:/images/clarice_the_bear.gif"
            visible: true
            Colorize {
                anchors.fill: parent
                source: colorizeSrc
                hue: 0.5
            }
        }
        RadialGradient {
            width: root.width / parent.columns - gridSpacing
            height: width
            horizontalRadius: 0.5 * width
            verticalRadius: 0.5 * height
            gradient: Gradient {
                GradientStop {
                    position: 0.0; color: "black"
                }
                GradientStop {
                    position: 1.0; color: "yellow"
                }
            }
        }
        Item {
            id: displaceItem
            width: root.width / parent.columns - gridSpacing
            height: width
            Image {
                id: displacementSrc
                source: "qrc:/images/clarice_the_bear.gif"
                width: parent.width
                height: parent.height
                smooth: true
                visible: false
            }

            Rectangle {
                id: displacement
                color: Qt.rgba(0.8, 0.2, 1.0, 1.0) // Red component defines the displacement along x-axis, green along y-axis
                anchors.fill: parent
                visible: false
            }
            Displace {
                anchors.fill: displacementSrc
                source: displacementSrc
                displacementSource: displacement
                displacement: 0.8
            }
        }
        DropShadow {
            width: root.width / parent.columns - gridSpacing
            height: width

            source: Image {
                source: "qrc:/images/clarice_the_bear.gif"
                smooth: true
            }
            color: Qt.rgba(0, 0, 0, 0.3)
            samples: 16
            radius: 8.0
            horizontalOffset: 5
            verticalOffset: 5
        }
        Item {
            width: root.width / parent.columns - gridSpacing
            height: width
            Image {
                id: blurSrc
                source: "qrc:/images/clarice_the_bear.gif"
                width: parent.width
                height: parent.height
                smooth: true
                visible: false
            }

            FastBlur {
                anchors.fill: blurSrc
                source: blurSrc
                radius: 8
            }
        }
        Item {
            width: root.width / parent.columns - gridSpacing
            height: width

            Image {
                id: dirImage
                source: "qrc:/images/clarice_the_bear.gif"
                width: parent.width
                height: parent.height
                smooth: true
                visible: false
            }

            DirectionalBlur {
                anchors.fill: dirImage
                source: dirImage
                angle: 180
                length: 18
                samples: 24
            }
        }
        Item {
            width: root.width / parent.columns - gridSpacing
            height: width
            Rectangle {
                anchors.fill: parent
                color: "black"
            }

            Image {
                id: glowSrc
                source: "qrc:/images/clarice_the_bear.gif"
                width: parent.width
                height: parent.height
                smooth: true
                visible: false
            }

            Glow {
                anchors.fill: glowSrc
                radius: 10
                samples: 20
                color: "white"
                source: glowSrc
            }
        }
        Item {
            width: root.width / parent.columns - gridSpacing
            height: width

            Image {
                id: mask
                source: "qrc:/images/clarice_the_bear.gif"
                width: parent.width
                height: parent.height
                smooth: true
                visible: false
            }

            Image {
                id: maskSrc
                source: "qrc:/images/butterfly.png"
                width: parent.width
                height: parent.height
                smooth: true
                visible: false
            }

            OpacityMask {
                anchors.fill: mask
                source: mask
                maskSource: maskSrc
            }
        }
    }
}
