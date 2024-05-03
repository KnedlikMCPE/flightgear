import QtQuick 2.4
import "."

Item {
    id: root
    property bool open: false

    implicitWidth: label.width + gearIcon.width + Style.margin
    implicitHeight: label.height

    state: "closed"

    states: [
        State {
            name: "closed"
            when: !root.open
            PropertyChanges { target: label; text: qsTr("Show more") }
        },



        State {
            name: "open"
            when: root.open
            PropertyChanges { target: label; text: qsTr("Show less") }
        }

    ]

    Text {
        id: label
        anchors.right: gearIcon.left
        anchors.rightMargin: Style.margin
        anchors.verticalCenter: parent.verticalCenter
        color: "white"
        font.underline: mouse.containsMouse
        font.pixelSize: Style.baseFontPixelSize
    }


    Image {
        id: gearIcon
        source: "qrc:///settings-gear-white"
        height: root.height - 2
        fillMode: Image.PreserveAspectFit
        anchors.right: parent.right
        anchors.rightMargin: Style.inset
        anchors.verticalCenter: parent.verticalCenter

    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: open = !open
        cursorShape: Qt.PointingHandCursor
    }
}
