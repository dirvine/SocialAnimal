import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Particles 2.0
import QtQuick.XmlListModel 2.0
import QtMultimedia 5.0
import FreedomCrypt 1.0

Rectangle {
  anchors.fill: parent

  Video {
    id: video
    width : root.width
    height : root.height
    MouseArea {
      anchors.fill: parent
      onClicked: {
        video.play()
      }
    }
    focus: true
    Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
    Keys.onLeftPressed: video.seek(video.position - 5000)
    Keys.onRightPressed: video.seek(video.position + 5000)
  }
  FileDialog {
    id: fileDialog
    title: "Please choose a file"
    nameFilters: [ "All files (*.*)", "All files (*)" ]
    selectMultiple : false
    onAccepted: {
      video.source = fileDialog.fileUrl
      video.play()
    }
  }
}
