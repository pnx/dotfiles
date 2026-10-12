import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

Rectangle {
  property int paddingY: 4
  property int paddingX: 8
  property string text: ""
  property string icon: ""
  property string tooltip: ""
  property string tooltipDescription: ""
  property alias textColor: label.color
  property alias acceptedButtons: mouseArea.acceptedButtons
  readonly property alias hovered: mouseArea.containsMouse
  property color backgroundColor: pal.button
  property color backgroundHoverColor: pal.mid

  SystemPalette { id: pal }

  signal clicked(int button)

  id: root
  implicitWidth: row.implicitWidth + (paddingX * 2)
  implicitHeight: row.implicitHeight + (paddingY * 2)

  color: mouseArea.containsMouse
    ? root.backgroundHoverColor
    : root.backgroundColor

  Behavior on color {
    ColorAnimation {
      duration: 150
    }
  }

  RowLayout {
    id: row
    anchors.centerIn: parent

    IconImage {
      visible: root.icon.length > 0
      source: root.icon
      implicitWidth: implicitHeight
      implicitHeight: row.implicitHeight > 0 ? row.implicitHeight : 20
    }

    Text {
      id: label
      visible: root.text.length > 0
      text: root.text
    }
  }

  Loader {
    active: tooltip.length > 0 || tooltipDescription.length > 0
    sourceComponent: Tooltip {
      item: root
      visible: mouseArea.containsMouse
      title: tooltip
      description: tooltipDescription
    }
  }

  MouseArea {
    id: mouseArea
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    anchors.fill: root
    acceptedButtons: Qt.LeftButton
    onClicked: mouse => root.clicked(mouse.button)
  }
}
