import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sightwalk/Screens/home/home.dart';
import 'package:sightwalk/models/user.dart';
import 'package:sightwalk/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<TheUser>(context);
    print(user);

    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
    //return either home or auth widget
  }
}