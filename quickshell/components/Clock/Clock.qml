import QtQuick
import Quickshell

Rectangle {
  property int paddingY: 4
  property int paddingX: 4
  property string format: "hh:mm:ss\nyyyy-MM-dd"
  property alias textColor: label.color

  id: root
  width: label.implicitWidth + root.paddingX
  height: label.implicitHeight + root.paddingY
  color: "transparent"

  SystemPalette { id: pal }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  Text {
    id: label
    anchors.centerIn: parent
    text: Qt.formatDateTime(clock.date, root.format)
    textFormat: Text.PlainText
    horizontalAlignment: Text.AlignRight
    color: pal.text
    font.pointSize: 11
  }
}
