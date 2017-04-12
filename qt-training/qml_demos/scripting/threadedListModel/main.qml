import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Threaded List Model")
    id: root
    width: 400; height: 200
    visible: true
    color: "gray"

    ListView {
        anchors.fill: parent
        model: listModel
        delegate: Component {
            Text { text: time }
        }

        ListModel { id: listModel }

        WorkerScript {
            id: worker
            source: "qrc:/script/dataloader.js"

        }

        Timer {
            id: timer
            interval: 2000; repeat: true
            running: true
            triggeredOnStart: true

            onTriggered: {
                var msg = {'action': 'appendCurrentTime', 'model': listModel};
                worker.sendMessage(msg);
            }
        }
    }
}
