import QtQuick 2.0
import info.shaan7.qmlweb 0.1 as QmlWeb

MouseArea {
    property alias target: mouseCursor.target

    hoverEnabled: true
    QmlWeb.MouseCursor {
        id: mouseCursor
        cursorShape: parent.containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
