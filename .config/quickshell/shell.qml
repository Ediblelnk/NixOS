import QtQuick
import Quickshell
import "file:/home/edibleink/.cache/wal" as ColorScheme

PanelWindow {
    id: window

    // You are explicitly calling the file "Theme.qml" here
    ColorScheme.Colors { id: theme }

    // --- Configuration ---
    property int waybarHeight: 45
    property int cornerRadius: 14
    property int borderWidth: 4
    property color frameColor: theme.color0

    // --- Dynamic Height Calculation ---
    height: window.screen.height - window.waybarHeight

    // --- Window Properties ---
    anchors {
        top: true
        left: true
        right: true
    }

    margins.top: window.waybarHeight
    color: "transparent"

    aboveWindows: true
    exclusionMode: ExclusionMode.Ignore
    mask: Region {}

    Canvas {
        anchors.fill: parent
        antialiasing: true

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            // 1. Fill the background
            ctx.fillStyle = window.frameColor;
            ctx.fillRect(0, 0, width, height);

            // 2. Prepare the cutout
            ctx.globalCompositeOperation = "destination-out";

            // --- Descriptive Variable Naming ---
            var startX = window.borderWidth;
            var startY = window.borderWidth;
            var cutoutWidth = width - (window.borderWidth * 2);
            var cutoutHeight = height - (window.borderWidth * 2);
            var internalRadius = window.cornerRadius;

            // 3. Draw the rounded internal frame
            ctx.beginPath();

            // Move to start of top-left curve
            ctx.moveTo(startX + internalRadius, startY);

            // Top edge to top-right
            ctx.lineTo(startX + cutoutWidth - internalRadius, startY);
            ctx.quadraticCurveTo(startX + cutoutWidth, startY, startX + cutoutWidth, startY + internalRadius);

            // Right edge to bottom-right
            ctx.lineTo(startX + cutoutWidth, startY + cutoutHeight - internalRadius);
            ctx.quadraticCurveTo(startX + cutoutWidth, startY + cutoutHeight, startX + cutoutWidth - internalRadius, startY + cutoutHeight);

            // Bottom edge to bottom-left
            ctx.lineTo(startX + internalRadius, startY + cutoutHeight);
            ctx.quadraticCurveTo(startX, startY + cutoutHeight, startX, startY + cutoutHeight - internalRadius);

            // Left edge back to top-left
            ctx.lineTo(startX, startY + internalRadius);
            ctx.quadraticCurveTo(startX, startY, startX + internalRadius, startY);

            ctx.closePath();
            ctx.fill();
        }
    }
}