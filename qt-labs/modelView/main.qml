import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Enginio 1.0

ApplicationWindow {
    property int bottomMargin: 10
    property int columnSpacing: 50
    property bool useEnginio: false

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
        id: stackView
        anchors.fill: parent
        initialItem: "qrc:/MainPage.qml"
        delegate: stackViewDelegate
    }

    StackViewDelegate {
        id: stackViewDelegate
        function getTransition(properties)
        {
            return pushTransition
        }

        function transitionFinished(properties)
        {
            properties.exitItem.opacity = 1
        }

        property Component pushTransition: StackViewTransition {
            PropertyAnimation {
                target: enterItem
                property: "opacity"
                from: 0
                to: 1
                duration: 700
            }
            PropertyAnimation {
                target: exitItem
                property: "opacity"
                from: 1
                to: 0
                duration: 700
            }
        }
    }

    EnginioClient {
        id: enginioClient
        backendId: "52b173cd5a3d8b15b10342bf"
        onError: console.log("Enginio error: " + reply.errorCode + ": " + reply.errorString)
    }

    EnginioModel {
        id: enginioModel
        client: enginioClient
        query: { // query for all objects of type "objects.image" and include not null references to files
            "objectType": "objects.image",
            "include": {"file": {}},
            "query" : { "file": { "$ne": null } }
        }
    }

    ListModel {
        id: imageModel
        ListElement {
            fileId: "qrc:/images/cloud.png"
        }
    }
}

