import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("GridView vs. TableView")

    Component.onCompleted: {
        for (var i = 0; i < 99; ++i) {
            simpleModel.append({"name": "Item " + i, "btnChecked": "false"});
        }
    }

    Row {
        GridView {
            width: root.width / 2
            height: root.height
            model: simpleModel
            delegate: gridViewDelegate
        }
        TableView {
            width: root.width / 2
            height: root.height
            TableViewColumn {
                title: "Item"
                width: root.width / 4
                // delegate: tableViewDelegate
                role: "name"
            }
            TableViewColumn {
                title: "Btn"
                width: root.width / 4
                role: "btnChecked"
                delegate: tableViewDelegate
            }

            model: simpleModel
        }
    }

    Component {
        id: gridViewDelegate
        Row {
            RadioButton {
                checked: (btnChecked === "false") ? false : true
                onClicked: {
                    // checked ? simpleModel.setProperty(index, "btnChecked", "true") : simpleModel.setProperty(index, "btnChecked", "false");
                }
            }
            Text {
                text: name
            }
            Component.onCompleted: {
                console.log("Item " + index + " created in the grid view.");
            }
        }
    }

    Component {
        id: tableViewDelegate
        Item {
            RadioButton {
                checked: (styleData.value === "false") ? false : true
                Component.onCompleted: {
                    console.log("Item " + styleData.row + " created in the table view.");
                }
                onClicked: {
                    checked ? simpleModel.setProperty(styleData.row, "btnChecked", "true") : simpleModel.setProperty(styleData.row, "btnChecked", "false");
                }
                onVisibleChanged: {
                    // checked = (styleData.value === "false") ? false : true;
                }
            }
        }
    }

    ListModel {
        id: simpleModel
    }
}
