import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Item {
  property int paddingY: 4
  property int paddingX: 4
  property alias bgColor: background.color
  property alias color: label.color
  id: root

  implicitWidth: label.implicitWidth + root.paddingX
  implicitHeight: label.implicitHeight + root.paddingY
  Layout.minimumWidth: 0
  Layout.fillWidth: true

  SystemPalette { id: pal }

  Rectangle {
    id: background
    color: "transparent"
    anchors.fill: parent

    Text {
      id: label
      anchors.centerIn: parent
      width: Math.max(0, parent.width - root.paddingX)
      text: Hyprland.activeToplevel?.title ?? ""
      // text: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      color: pal.text
      elide: Text.ElideRight
    }
  }
}
