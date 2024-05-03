import QtQuick 2.4

import "."

Text {
    id: root
    font.pixelSize: Style.baseFontPixelSize

    property bool enabled: true
    property bool hover: false

    color: hover ? Style.themeColor : (root.enabled ? Style.baseTextColor : Style.disabledTextColor)
}
