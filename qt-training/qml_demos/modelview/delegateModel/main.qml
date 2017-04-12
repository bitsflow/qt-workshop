import QtQuick 2.4
import QtQuick.Window 2.2
import QtQml.Models 2.1

Window {
    visible: true
    width: 640
    height: 400

    ListModel {
        id: myModel
        ListElement {
            display: "Item 1"
        }
        ListElement {
            display: "Item 2"
        }
        ListElement {
            display: "Item 3"
        }
    }

    DelegateModel {
        id: visualModel
        delegate: packageDelegate
        model: myModel
    }

    ListView {
        id: lv
        height: parent.height/2
        width: parent.width

        model: visualModel.parts.list
    }

    GridView {
        y: parent.height/2
        height: parent.height/2
        width: parent.width
        cellWidth: width / 2
        cellHeight: 50
        model: visualModel.parts.grid
    }

    Component {
        id: packageDelegate

        Package {
            id: root
            property int upTo: 1
            Text { id: listDelegate; width: parent.width; height: 25; text: 'Empty'; Package.name: 'list' }
            Text { id: gridDelegate; width: parent.width / 2; height: 50; text: 'Empty'; Package.name: 'grid' }

            Rectangle {
                id: wrapper
                // width: (parent.width === undefined) ? 0 : parent.width
                height: 25
                color: 'lightsteelblue'

                Text { text: display; anchors.centerIn: parent }
                state: root.upTo > index ? 'inGrid' : 'inList'
                states: [
                    State {
                        name: 'inList'
                        ParentChange { target: wrapper; parent: listDelegate
                            width: parent.width
                        }
                    },
                    State {
                        name: 'inGrid'
                        ParentChange {
                            target: wrapper; parent: gridDelegate
                            x: 0; y: 0; width: gridDelegate.width; height: gridDelegate.height
                        }
                    }
                ]

                transitions: [
                    Transition {
                        ParentAnimation {
                            NumberAnimation { properties: 'x,y,width,height'; duration: 300 }
                        }
                    }
                ]
            }
        }
    }
}
