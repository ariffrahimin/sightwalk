import 'package:flutter/material.dart';
import 'package:sightwalk/Screens/home/home.dart';
import 'package:sightwalk/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Authenticate();
    //return either home or auth widget
  }
}