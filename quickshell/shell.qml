//@ pragma UseQApplication

import Quickshell
import QtQuick
import QtQuick.Layouts
import "./components/Bar"
import "./components/Workspace"
import "./components/Clock"
import "./components/WindowTitle"
import "./components/Tray"
import "./components"

Scope {
  id: root

  // Output names for the bar; use [] for all connected screens.
  property list<string> barScreens: ["DP-2"]

  Variants {
    model: Quickshell.screens.filter(screen =>
      root.barScreens.length === 0 || root.barScreens.indexOf(screen.name) !== -1)

    Bar {
      required property ShellScreen modelData

      id: bar
      screen: modelData
      top: false
      implicitHeight: 40
      marginRight: 10

      left: [
        WorkspaceList { }
      ]

      center: [
        WindowTitle { }
      ]

      right: [
        Tray { },
        Volume { },
        Clock { }
      ]
    }
  }
}
