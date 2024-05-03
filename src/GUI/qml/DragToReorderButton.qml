import QtQuick 2.4
import "."

Item {
    property bool canMoveUp: true
    property bool canMoveDown: true

    width: height
    height: icon.implicitHeight + 1
    visible: canMoveDown || canMoveUp

    signal moveUp();
    signal moveDown();

    Image {
        id: icon
        x: 0
        y: 0
        source: "qrc:///reorder-list-icon-small"
    }


    MouseArea {
        id: moveUpArea
        enabled: parent.canMoveUp
        hoverEnabled: enabled
        height: parent.height / 2
        width: parent.width
        onClicked: {
            parent.moveUp();
        }
    }

    MouseArea {
        id: moveDownArea
        enabled: parent.canMoveDown
        hoverEnabled: enabled
        height: parent.height / 2
        width: parent.width
        anchors.bottom: parent.bottom
        onClicked: {
            parent.moveDown();
        }
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.left
        anchors.rightMargin: Style.margin
        visible: moveUpArea.containsMouse || moveDownArea.containsMouse
        text: moveUpArea.containsMouse ? qsTr("Move up") : qsTr("Move down")
    }
}
