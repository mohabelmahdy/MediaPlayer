import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtMultimedia 5.8
import QtQml 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property int cc



    Slider {
        id: vol
        objectName: "vol"
        orientation: "Vertical"
        anchors.right: parent.right
        height: parent.height/2
       // anchors.topMargin:parent.height/4
       //anchors.rightMargin:parent.width/20
        z:2
        from: 0
        value: 0
        to: 100
        onValueChanged: {
            //video.volume=vol.value/100
            mohsen.setVolume(vol.value)
        }
    }
    Image {
        id: volumeIcon
        objectName: "volumeIcon"
        z:2
        width: 64
        height: 64
        anchors.top: vol.bottom
        anchors.right: parent.right
        source: "qrc:volume_256.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log(volumeIcon.source)
                if(volumeIcon.source == "qrc:volume_256.png"){
                    volumeIcon.source="qrc:/mute_256.png"
                    vol.value=0
                }
                else{
                    volumeIcon.source="qrc:/volume_256.png"
                    vol.value=100
                }


            }
        }

    }

    Slider {
        id: run
        objectName: "run"
        z:2
        from: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        width: parent.width
        value: video.position/(video.duration/100)
        to: 100
        onValueChanged: {
            video.seek(run.value*(video.duration/100))
        }



    }

    Video{
        id:video
        objectName:"video"
        //anchors.centerIn: parent
        anchors.top: run.bottom
        //width: 700
       // height: 700
        anchors.fill: parent
        autoPlay: true
        volume : cc/100
        //seek: true
        source :"animation.mp4"
        //source:"C:/Users/melmahdy/Desktop/Blender.mp4"
        //source :"https://www.youtube.com/watch?v=1XZGulDxz9o"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(video.playbackState == MediaPlayer.PlayingState){
                    video.pause()
                }else{
                    video.play()
                }
            }
        }
    }


}
