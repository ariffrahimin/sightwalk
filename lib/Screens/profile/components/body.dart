// import 'package:alan_voice/alan_voice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sightwalk/Screens/camera/camera_screen.dart';
import 'package:sightwalk/Screens/home/home.dart';
import 'package:sightwalk/components/loading.dart';
import 'package:sightwalk/screens/profile/components/profile_edit.dart';
import 'package:sightwalk/services/auth.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

import '../profile.dart';

String name;
String age;
Future getloc;
String phoneNo;
String firebaseuid = FirebaseAuth.instance.currentUser.uid.toString();
final usersref = FirebaseFirestore.instance.collection('profile');
final AuthService _auth = AuthService();

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  VoiceController _voiceController;
  @override
  void initState() {
    _voiceController = FlutterTextToSpeech.instance.voiceController();
    getloc = getUser();
    super.initState();
    setState(() {
      _voiceController.init().then((_) {
        _voiceController.speak(
          "Swipe to the right to naviigate back home",
          VoiceControllerOptions(),
        );
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getloc,
            builder: (context, name) {
              if (name == null || age == null || phoneNo == null) {
                return Loading();
              } else {
                return profileView(context);
              }
            }));
  }
}

Future<void> getUser() async {
  await new Future.delayed(const Duration(seconds: 3));
  final DocumentSnapshot docs = await usersref.doc(firebaseuid).get();
  name = docs.data()['name'];
  age = docs.data()['age'].toString();
  phoneNo = docs.data()['phone_no'].toString();
  print(name);
  print(age);
  print(phoneNo);
}

Widget profileView(context) {
  return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
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
          actions: [
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.person),
                label: Text('logout')),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                    child: Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            name,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border:
                              Border.all(width: 1.0, color: Colors.white70)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child: Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            age,
                            //age,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border:
                              Border.all(width: 1.0, color: Colors.white70)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child: Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            phoneNo,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border:
                              Border.all(width: 1.0, color: Colors.white70)),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Edit(
                                name: name,
                                age: age,
                                phoneNo: phoneNo,
                              );
                            },
                          ));
                        },
                        child: Container(
                          height: 70,
                          width: 200,
                          child: Align(
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 20),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity > 0) {
          Navigator.pop(context);
        }
      });
}
