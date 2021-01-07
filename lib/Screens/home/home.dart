import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import 'package:sightwalk/Screens/camera/camera_screen.dart';
import 'package:sightwalk/Screens/cashclassify/cash.dart';
import 'package:flutter_button/3d/3d_button.dart';
import 'package:sightwalk/Screens/profile/profile.dart';
import 'package:sightwalk/services/auth.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

//Voice guide for initialization -> User hear voice to guide towards the button.
//butang besar-besar
// import 'package:alan_voice/alan_voice.dart';

List<CameraDescription> cameras; // initialize camera lists

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CameraDescription> cameras;
  final AuthService _auth = AuthService(); //authentication object for service

  VoiceController _voiceController;
  @override
  void initState() {
    _voiceController = FlutterTextToSpeech.instance.voiceController();
    super.initState();
    _setupCameras().then((value) {
      setState(() {
        _voiceController.init().then((_) {
          _voiceController.speak(
            "Welcome to sightwalk, for instructions, please swipe to the right",
            VoiceControllerOptions(),
          );
        });
      });
    });
  }

  Future<void> _setupCameras() async {
    try {
      // initialize cameras.
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
    } on CameraException catch (e) {
      print('Error $e.code \n Error Message: $e.message');
      // do something on error.
    }
  }

  void voiceObj() {
    setState(() {
      print("Object Detection");
      _voiceController.init().then((_) {
        _voiceController.speak(
          "This button Lead to Object Detection Page, Hold to confirm",
          VoiceControllerOptions(),
        );
      });
    });
  }

  void confirmObj() {
    setState(() {
      print("Object Detection");
      _voiceController.init().then((_) {
        _voiceController.speak(
          "Navigating to Object Detection",
          VoiceControllerOptions(),
        );
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LiveFeed(cameras);
      }));
    });
  }

  void intro() {
    setState(() {
      print("Money classifier");
      _voiceController.init().then((_) {
        _voiceController.speak(
          "There are two big buttons on the screen, at the top side, is the Realtime Object Detection Module, at the bottom side, is the money classification module. Tap once at the screen to identify the buttons",
          VoiceControllerOptions(),
        );
      });
    });
  }

  void voiceCash() {
    setState(() {
      print("Money classifier");
      _voiceController.init().then((_) {
        _voiceController.speak(
          "This button Lead to Money classifier Page, Hold to confirm",
          VoiceControllerOptions(),
        );
      });
    });
  }

  void confirmCash() {
    setState(() {
      print("Money classifier");
      _voiceController.init().then((_) {
        _voiceController.speak(
          "Navigating to Money classifier",
          VoiceControllerOptions(),
        );
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Cash();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    double buttonheight = 320;
    return GestureDetector(
        child: Scaffold(
          backgroundColor: Colors.amber[200],
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleGestureDetector(
                    child: Button3D(
                      style: StyleOf3dButton(
                        backColor: Colors.amber[900],
                        topColor: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: buttonheight,
                      width: 350,
                      onPressed: () {
                        voiceObj();
                      },
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset('assets/images/eye2.png',
                              height: 60.0, width: 60.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Object Detection ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                      ),
                    ),
                    onLongPress: confirmObj,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SimpleGestureDetector(
                    child: Button3D(
                      style: StyleOf3dButton(
                        backColor: Colors.amber[900],
                        topColor: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: buttonheight,
                      width: 350,
                      onPressed: () {
                        voiceCash();
                      },
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset('assets/images/money.png',
                              height: 60.0, width: 60.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Money Classifier  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                      ),
                    ),
                    onLongPress: confirmCash,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MyProfile();
                        },
                      ));
                    },
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity > 0) {
            intro();
          }
        });
  }
}
