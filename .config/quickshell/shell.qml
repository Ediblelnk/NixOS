// shell.qml
import Quickshell

import QtQuick   

Scope {
  Bar {}

  PanelWindow {
    anchors.bottom: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        radius: 10  // Adjust for desired roundness
        color: "#1a1b26"  // Your bar color
    }
  }
}