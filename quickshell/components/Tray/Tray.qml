import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import ".."

RowLayout {
  id: root
  spacing: 4
  property color backgroundColor: "transparent"
  property color backgroundHoverColor: "transparent"

  Repeater {
    model: SystemTray.items
    TrayItem {
      id: entry
      required property SystemTrayItem modelData
      readonly property var tooltipData: getTooltip(modelData)

      function getTooltip(item) {
        // Quick hack for nextcloud
        if (item.id == "Nextcloud") {
          return [
            "Nextcloud",
            item.tooltipTitle
          ]
        }
        return [
          item.tooltipTitle || item.title,
          item.tooltipDescription || ""
        ]
      }

      icon: modelData.icon
      tooltip: tooltipData[0]
      tooltipDescription: tooltipData[1]
      backgroundColor: root.backgroundColor
      backgroundHoverColor: root.backgroundHoverColor

      onClicked: button => {
        switch (button) {
          case Qt.LeftButton:
          if (modelData.onlyMenu) {
            menuAnchor.open()
          } else {
            modelData.activate()
          }
          break

        case Qt.RightButton:
          if (modelData.hasMenu) {
            menuAnchor.open()
          } else {
            modelData.secondaryActivate()
          }
          break
        }
      }

      QsMenuAnchor {
        id: menuAnchor
        menu: entry.modelData.menu

        anchor {
          item: entry

          edges: Edges.Top | Edges.Left
          gravity: Edges.Top | Edges.Right

          adjustment: PopupAdjustment.All
        }
      }
    }
  }
}
