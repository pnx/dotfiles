import QtQuick
import QtQuick.Layouts
import ".."

Button {
  property bool indicatorTop: true
  property int indicatorHeight: 2
  property color indicatorColor

  id: root

  Rectangle {
    anchors {
      top: root.indicatorTop ? parent.top : undefined
      bottom: !root.indicatorTop ? parent.buttom : undefined
    }
    implicitHeight: parent.indicatorHeight
    implicitWidth: parent.implicitWidth
    color: root.indicatorColor
  }
}
