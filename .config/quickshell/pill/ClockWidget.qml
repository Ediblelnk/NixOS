// ClockWidget.qml

import QtQuick
import Quickshell.Widgets
import "Singletons"

WrapperRectangle {
  color: "red"
  margin: 4

  Text {
    id: clockText
    text: Time.time
    color: "white"
    font.pixelSize: 14
  }
}
