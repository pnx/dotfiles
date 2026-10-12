import Quickshell
import QtQuick
import QtQuick.Layouts

PopupWindow {
  required property Item item
  property alias title: title.text
  property alias description: description.text
  property int paddingX: 16
  property int paddingY: 8

  id: root

  anchor {
    item: root.item
    gravity: Edges.Top
    adjustment: PopupAdjustment.All
  }

  color: root.visible ? pal.dark : "transparent"
  implicitHeight: textContainer.implicitHeight + (root.paddingY * 2)
  implicitWidth: textContainer.implicitWidth + (root.paddingX * 2)
  SystemPalette { id: pal }

  Behavior on color {
    ColorAnimation {
      duration: 150
    }
  }

  ColumnLayout {
    id: textContainer
    anchors.centerIn: parent
    Text {
      id: title
      visible: text.length > 0
      color: root.visible ? pal.text : "transparent"
      font.weight: Font.Bold
    }

    Text {
      id: description
      visible: text.length > 0
      color: root.visible ? pal.text : "transparent"
    }
  }
}
