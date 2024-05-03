import QtQuick 2.4
import "."

Rectangle {
    id: root

    property bool enabled: true
    signal clicked

    width: label.implicitWidth + height + Style.margin
    height: icon.implicitHeight + 1
    radius: Style.roundRadius

    color: enabled ? (mouse.containsMouse ? Style.activeColor : Style.themeColor) : Style.disabledThemeColor

    Text {
        id: label
        text: qsTr("Add")
        color: "white"
        anchors {
            left: parent.left
            leftMargin: Style.margin
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: Style.baseFontPixelSize
    }

    Image {
        id: icon
        anchors.right: parent.right
        source: "qrc:///add-icon"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        enabled: root.enabled
        hoverEnabled: true

        onClicked: {
            root.clicked();
        }

    }
}
