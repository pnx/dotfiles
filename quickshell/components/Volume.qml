import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import Quickshell.Io


Item {
  id: root
  readonly property PwNode sink: Pipewire.defaultAudioSink

  SystemPalette { id: pal }

  Process {
    id: pavucontrol
    command: ["pavucontrol"]
  }

  implicitWidth: content.implicitWidth
  implicitHeight: content.implicitHeight

  PwObjectTracker {
    objects: [root.sink]
  }

  Row {
    id: content
    spacing: 6

    Text {
      color: pal.text
      text: {
        if (!root.sink?.audio || root.sink.audio.muted)
        return "󰝟";

        if (root.sink.audio.volume < 0.33)
        return "󰕿";

        if (root.sink.audio.volume < 0.66)
        return "󰖀";

        return "󰕾";
      }
    }

    Text {
      color: pal.text
      text: root.sink?.audio ? Math.round(root.sink.audio.volume * 100) + "%" : "--%"
    }
  }

  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton

    onClicked: mouse => {
      if (mouse.button === Qt.RightButton) {
        pavucontrol.startDetached()
      } else if (mouse.button === Qt.LeftButton) {
        if (root.sink?.audio)
        root.sink.audio.muted = !root.sink.audio.muted
      }
    }

    onWheel: event => {
      if (!root.sink?.audio)
      return;
      const delta = event.angleDelta.y > 0 ? 0.05 : -0.05;

      root.sink.audio.volume = Math.max(0, Math.min(1, root.sink.audio.volume + delta));
    }
  }
}
