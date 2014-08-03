import QtQuick 2.1
import QtQuick.Controls 1.0

Image {
    id: delegateImage
    signal clicked
    property bool isCurrentItem
    property real progress

    property string url_without_size: "http://farm" + farm + ".static.flickr.com/" + server + "/" + id + "_" + secret
    property string fullImageUrl: url_without_size + ".jpg"
    source: url_without_size + "_s.jpg"

    ProgressBar {
        anchors.fill: parent
        visible: value != 1
        value: delegateImage.progress
    }

    MouseAreaWithLinkMouseCursor {
        anchors.fill: parent
        target: parent
        onClicked: delegateImage.clicked()
    }
}
