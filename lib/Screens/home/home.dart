import 'package:flutter/material.dart';
import 'package:sightwalk/screens/camera/camera_screen.dart';
import 'package:sightwalk/screens/profile/profile.dart';
import 'package:sightwalk/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        centerTitle: true,
        actions: [
          FlatButton.icon(
            onPressed: ()async{
              await _auth.signOut();
            }, 
            icon: Icon(Icons.person), 
            label: Text('logout')
            ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/asset/images/background.png'),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover
          ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            RaisedButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CameraScreen();
                },));
              },
              child: Icon(Icons.camera_alt,
                          size: 30,),
              ),
              SizedBox(height: 12,),

              RaisedButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyProfile();
                },));
              },
              child: Icon(Icons.person,
                          size: 30,),
              ),

          ],
        ),
      ),
      ),
      
    );
  }
}