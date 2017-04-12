import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Key Navigation")
    id: root
    width: 300; height: 300
    visible: true
    color: "black"

    Grid {
        anchors.centerIn: parent
        columns: 2
        spacing: 20
        Rectangle {
            id: rect1
            width: 120; height: 120
            color: focus ? "red" : "green"
            focus: true  // Initially focused rect
            KeyNavigation.right: rect2
            KeyNavigation.left: rect4
            KeyNavigation.up: rect3
            KeyNavigation.down: rect3

            KeyNavigation.tab: rect2
            KeyNavigation.backtab: rect4
        }
        Rectangle {
            id: rect2
            width: 120; height: 120
            color: focus ? "red" : "green"
            KeyNavigation.right: rect3
            KeyNavigation.left: rect1
            KeyNavigation.up: rect4
            KeyNavigation.down: rect4

            KeyNavigation.tab: rect3
            KeyNavigation.backtab: rect1
        }
        Rectangle {
            id: rect3
            width: 120; height: 120
            color: focus ? "red" : "green"
            KeyNavigation.right: rect4
            KeyNavigation.left: rect2
            KeyNavigation.up: rect1
            KeyNavigation.down: rect1

            KeyNavigation.tab: rect4
            KeyNavigation.backtab: rect2
        }
        Rectangle {
            id: rect4
            width: 120; height: 120
            color: focus ? "red" : "green"
            KeyNavigation.right: rect1
            KeyNavigation.left: rect3
            KeyNavigation.up: rect2
            KeyNavigation.down: rect2

            KeyNavigation.tab: rect1
            KeyNavigation.backtab: rect3
        }
    }
}
