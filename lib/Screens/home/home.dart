import 'package:flutter/material.dart';
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
      
    );
  }
}