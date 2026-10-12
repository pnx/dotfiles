import Quickshell
import Quickshell.Hyprland
import QtQuick

Item {
  property int paddingY: 4
  property int paddingX: 4
  property alias bgColor: background.color
  property alias color: label.color
  id: root

  implicitWidth: label.implicitWidth + root.paddingX
  implicitHeight: label.implicitHeight + root.paddingY

  SystemPalette { id: pal }

  Rectangle {
    id: background
    color: "transparent"
    anchors.fill: parent

    Text {
      id: label
      anchors.centerIn: parent
      text: Hyprland.activeToplevel?.title ?? ""
      color: pal.text
    }
  }
}
