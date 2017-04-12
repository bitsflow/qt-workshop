import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.XmlListModel 2.0

Window {
    title: qsTr("XML Model")
    id: root
    width: 440; height: 260
    visible: true
    color: "#404040"

    XmlListModel {
        id: xmlModel
        source: "qrc:/files/items.xml"
        query: "/items/item"

        XmlRole { name: "title"; query: "string()" }
        XmlRole { name: "link"; query: "@link/string()" }
    }

    TitleDelegate {
        id: xmlDelegate
    }

    ListView {
        anchors.fill: parent
        anchors.margins: 4
        model: xmlModel
        delegate: xmlDelegate
    }
}
