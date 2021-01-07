import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

String string;
String slice;

class Cash extends StatefulWidget {
  @override
  _CashState createState() => _CashState();
}

class _CashState extends State<Cash> {
  VoiceController _voiceController;
  List _outputs;
  File _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _voiceController = FlutterTextToSpeech.instance.voiceController();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
        _voiceController.init().then((_) {
          _voiceController.speak(
            "Slide to the left to take a picture, and slide to the right to navigate back home",
            VoiceControllerOptions(),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Money Classifier'),
          backgroundColor: Colors.amberAccent,
        ),
        body: _loading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _image == null ? Container() : Image.file(_image),
                    SizedBox(
                      height: 20,
                    ),
                    _outputs != null
                        ? Text(
                            slice,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              background: Paint()..color = Colors.white,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: pickImage,
          child: Icon(Icons.image),
        ),
      ),
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity < 0) {
          pickImage();
        } else if (details.primaryVelocity > 0) {
          Navigator.pop(context);
        }
      },
    );
  }

  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _image = File(image.path);
      setState(() {
        _loading = true;
      });
    } else {
      print("No image Selected");
    }

    classifyImage(image);
  }

  voicefunct() {
    setState(() {
      print("Object Detection");
      string = _outputs[0]["label"].toString();
      slice = string.substring(1, string.length);
      _voiceController.init().then((_) {
        _voiceController.speak(
          slice,
          VoiceControllerOptions(),
        );
      });
    });
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output;
      string = _outputs[0]["label"].toString();
      slice = string.substring(1, string.length);
      voicefunct();
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/modelv1.tflite",
      labels: "assets/labelsv1.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
