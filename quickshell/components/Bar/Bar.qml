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

  BarSection {
    id: leftContainer
    anchors.left: parent.left
    anchors.leftMargin: root.marginLeft
  }

  BarSection {
    id: centerContainer
    anchors.horizontalCenter: parent.horizontalCenter
  }

  BarSection {
    id: rightContainer
    anchors.right: parent.right
    anchors.rightMargin: root.marginRight
  }
}
