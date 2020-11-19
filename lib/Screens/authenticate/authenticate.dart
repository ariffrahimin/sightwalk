import 'package:flutter/material.dart';
import 'package:sightwalk/screens/login/login.dart';
import 'package:sightwalk/screens/welcome/welcome_screen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WelcomeScreen(),
      
    );
  }
}