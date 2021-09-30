// import 'package:alan_voice/alan_voice.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'components/bounding_box.dart';
import 'components/camera_structure.dart';
import 'dart:math' as math;
import 'package:tflite/tflite.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

class LiveFeed extends StatefulWidget {
  final List<CameraDescription> cameras;
  LiveFeed(this.cameras);
  @override
  _LiveFeedState createState() => _LiveFeedState();
}

class _LiveFeedState extends State<LiveFeed> {
  VoiceController _voiceController;
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
    _voiceController = FlutterTextToSpeech.instance.voiceController();
    super.initState();
    loadTfModel().then((value) {
      setState(() {
        _voiceController.init().then((_) {
          _voiceController.speak(
            "slide to the right to navigate back home",
            VoiceControllerOptions(),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return GestureDetector(
        child: Scaffold(
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
        ),
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity > 0) {
            Navigator.pop(context);
          }
        });
  }
}
