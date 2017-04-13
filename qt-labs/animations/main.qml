import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    property int bottomMargin: 10
    property int columnSpacing: 50

    visible: true
    width: 640
    height: 480
    title: qsTr("Image App")
    style: ApplicationWindowStyle {
        background: Rectangle {
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#000000";
                }
                GradientStop {
                    position: 1.00;
                    color: "#b9b3b3";
                }
            }
        }
    }

    StackView {
        id: pageStack
        anchors.fill: parent
        initialItem: "qrc:/MainPage.qml"
        delegate: StackViewDelegate {
            function transitionFinished(properties) {
                properties.exitItem.scale = 1.0;
            }
            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 2000
                }
                PropertyAnimation {
                    target: exitItem
                    property: "scale"
                    from: 1.0
                    to: 0.0
                    duration: 2000
                }
            }
        }
    }
}

