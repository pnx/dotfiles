import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
  SystemPalette { id: pal }

  property color buttonTextColor: pal.text
  property color buttonBackgroundColor: "transparent"
  property color buttonIndicatorColor: "transparent"
  property color buttonIndicatorFocusColor: pal.accent
  property color buttonIndicatorUrgentColor: pal.highlightedText

  id: root
  spacing: 0

  Repeater {
    model: Hyprland.workspaces
    WorkspaceButton {
      required property HyprlandWorkspace modelData

      Layout.fillHeight: true

      indicatorTop: false
      text: modelData.name
      implicitWidth: root.height

      color: root.buttonBackgroundColor
      textColor: root.buttonTextColor
      indicatorColor: modelData.urgent
        ? root.buttonIndicatorUrgentColor
        : (
          modelData.focused
            ? root.buttonIndicatorFocusColor
            : root.buttonIndicatorColor
        )

      onClicked: modelData.activate()
    }
  }
}
