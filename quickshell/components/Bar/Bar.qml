import Quickshell
import QtQuick.Layouts
import QtQuick
import "../"

PanelWindow {
  SystemPalette { id: pal }
  property bool top: true

  property real marginRight: 0
  property real marginLeft: 0

  property alias left: leftContainer.data
  property alias center: centerContainer.data
  property alias right: rightContainer.data

  id: root
  implicitHeight: 32

  color: pal.window

  anchors {
    top: root.top
    bottom: !root.top
    left: true
    right: true
  }

  Item {
    anchors.fill: parent

    BarSection {
      id: leftContainer
      anchors.left: parent.left
      anchors.leftMargin: root.marginLeft
    }

    BarSection {
      id: centerContainer
      anchors.horizontalCenter: parent.horizontalCenter
      width: Math.min(implicitWidth, Math.max(0, 2 * Math.min(
        parent.width / 2 - (leftContainer.x + leftContainer.width),
        rightContainer.x - parent.width / 2
      )))
      clip: true
    }

    BarSection {
      id: rightContainer
      anchors.right: parent.right
      anchors.rightMargin: root.marginRight
    }
  }
}
