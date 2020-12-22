import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sightwalk/models/user.dart';

String name;
String age;
Future getloc;
String phoneNo;
String firebaseuid = FirebaseAuth.instance.currentUser.uid.toString();
final usersref = FirebaseFirestore.instance.collection('profile');

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    getloc = getUser();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getloc,
            builder: (context, name) {
              if (name == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                while (name == null) {
                  print('not connecting');
                }
                return profileView(context);
              }
            }));
  }
}

Future<void> getUser() async {
  final DocumentSnapshot docs = await usersref.doc(firebaseuid).get();
  name = docs.data()['name'];
  age = docs.data()['age'].toString();
  phoneNo = docs.data()['phone_no'].toString();
  print(name);
  print(age);
  print(phoneNo);
}

Widget profileView(context) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: Colors.black54,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
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
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 1.0, color: Colors.white70)),
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
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 1.0, color: Colors.white70)),
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
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 1.0, color: Colors.white70)),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 70,
                    width: 200,
                    child: Align(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white70, fontSize: 20),
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
  );
}
