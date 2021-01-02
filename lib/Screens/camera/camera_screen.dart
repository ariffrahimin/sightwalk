// import 'package:alan_voice/alan_voice.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sightwalk/Screens/home/home.dart';
import 'package:sightwalk/Screens/profile/profile.dart';
import 'components/bounding_box.dart';
import 'components/camera_structure.dart';
import 'dart:math' as math;
import 'package:tflite/tflite.dart';

class LiveFeed extends StatefulWidget {
  final List<CameraDescription> cameras;
  LiveFeed(this.cameras);
  @override
  _LiveFeedState createState() => _LiveFeedState();
}

class _LiveFeedState extends State<LiveFeed> {
  // _LiveFeedState() {
  //   AlanVoice.addButton(
  //       "f18c82d486b0258e40767133e17cb02d2e956eca572e1d8b807a3e2338fdd0dc/stage",
  //       buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

  //   AlanVoice.callbacks.add((command) => _handleCommand(command.data));
  // }

  // void _handleCommand(Map<String, dynamic> command) {
  //   switch (command["command"]) {
  //     case "navigation":
  //       _navigateTo(command["route"]);
  //       break;
  //     default:
  //       debugPrint("Unknown command: ${command}");
  //   }
  // }

  // void _navigateTo(String screen) {
  //   switch (screen) {
  //     case "profile":
  //       Navigator.push(context, MaterialPageRoute(
  //         builder: (context) {
  //           return MyProfile();
  //         },
  //       ));
  //       break;
  //     case "back":
  //       Navigator.pop(context);
  //       break;
  //     case "detection":
  //       print("already in object detection");

  //       break;
  //     case "home":
  //       Navigator.push(context, MaterialPageRoute(
  //         builder: (context) {
  //           return Home();
  //         },
  //       ));
  //       break;
  //     case "logout":
  //       print("go to profile first");
  //       break;
  //     default:
  //       print("Unknown screen: $screen");
  //   }
  // }

  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  initCameras() async {}
  loadTfModel() async {
    await Tflite.loadModel(
      // load tensorflow model and label from assets
      model: "assets/ssd_mobilenet.tflite",
      labels: "assets/ssd_mobilenet.txt",
    );
  }

  /* 
  The set recognitions function assigns the values of recognitions, imageHeight and width to the variables defined here as callback
  */
  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  void initState() {
    super.initState();
    loadTfModel();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Real Time Object Detection',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Stack(
        children: <Widget>[
          CameraFeed(widget.cameras, setRecognitions),
          BoundingBox(
            _recognitions == null ? [] : _recognitions,
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height,
            screen.width,
          ),
        ],
      ),
    );
  }
}
