import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sightwalk/models/user.dart';
import 'package:sightwalk/screens/authenticate/authenticate.dart';
import 'package:sightwalk/screens/home/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    //return either home or auth widget
  }
}
