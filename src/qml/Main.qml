import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import QtMultimedia 5.0
import FreedomCrypt 1.0


ApplicationWindow {
  id: root
  title: qsTr("Social Animal 1.0")
  minimumWidth: 600
  minimumHeight: 400

  FreedomCryptModel {
    id: freedom
  }

  Video {
    id: video
    width : root.width
    height : root.height
    MouseArea {
      id: videomousearea
      hoverEnabled: true
      anchors.fill: parent
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
  Rectangle {
    id: buttons
    color: white
    opacity: 0.3
    width: 140
    height: 30
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent
    anchors.bottomMargin: 10
    anchors.leftMargin: 40
    anchors.rightMargin: 40

    visible: video.playbackState && videomousearea.containsMouse ? true : false
  Row {
    id: videorow
    width: parent.width
    spacing: 4
    ToolButton {
      iconSource: "qrc:/images/black/circledbackward.svg"
      width: 30
      height: 30
      tooltip: "Rewind "
      onClicked : video.seek(video.position - 5000)
    }
    ToolButton {
      iconSource: "qrc:/images/black/pause.svg"
      width: 30
      height: 30
      tooltip: "Pause "
      onClicked : {
        video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
        iconSource = (iconSource == "qrc:/images/black/pause.svg")  ? "qrc:/images/black/play.svg" : "qrc:/images/black/pause.svg"
      }
    }
    ToolButton {
      iconSource: "qrc:/images/black/circledforward.svg"
      width: 30
      height: 30
      tooltip: "forward "
      onClicked : video.seek(video.position + 5000)
    }
    ToolButton {
      iconSource: "qrc:/images/black/user.svg"
      width: 30
      height: 30
      tooltip: "Share with friend "
    }
  }
  }
    Row {
      id: buttonlayout
      width: root.width
      visible:  video.playbackState ? false : true
      spacing: 4
      Button {
        iconSource: "qrc:/images/social/twitter.svg"
        width: 30
        height: 30
      }
      Button {
        iconSource: "qrc:/images/social/facebook.svg"
        width: 30
        height: 30
      }
      Button {
        iconSource: "qrc:/images/social/instagram.svg"
        width: 30
        height: 30
      }
      Button {
        iconSource: "qrc:/images/social/googleplus.svg"
        width: 30
        height: 30
      }
      Button {
        iconSource: "qrc:/images/social/linkedin.svg"
        width: 30
        height: 30
      }
      Button {
        iconSource: "qrc:/images/social/reddit.svg"
        width: 30
        height: 30
      }
      Button {
        iconSource: "qrc:/images/social/youtube.svg"
        width: 30
        height: 30
        onClicked: { fileDialog.open() }
      }
      Button {
        iconSource: "qrc:/images/social/wordpress.svg"
      }
      Button {
        iconSource: "qrc:/images/social/aboutme.svg"
      }
      Button {
        iconSource: "qrc:/images/social/flickr.svg"
      }
      Button {
        iconSource: "qrc:/images/social/github.svg"
      }
    }


//      statusBar: StatusBar {
//          id: statusbar
//          height: 12
//          anchors.right: parent.right
//          anchors.left: parent.left
//          anchors.top: parent.top
//              Label {
//                  id: statusrow
//                  anchors.centerIn: parent
//                  text: "Please login"
//                  fontSizeMode: Text.Fit
//              }
//      }
}
