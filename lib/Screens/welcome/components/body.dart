import 'package:flutter/material.dart';
import 'package:sightwalk/Screens/login/login.dart';
import 'package:sightwalk/Screens/signup/signup.dart';
import 'package:sightwalk/components/round_button.dart';
import 'package:sightwalk/services/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.png',
            ),
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
              ),
              Image(
                image: AssetImage('assets/images/footsteps.png'),
              ),

              // ignore: missing_required_param
              RoundedButton(
                text: "REGISTER",
                press: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ));
                },
              ),
              // ignore: missing_required_param
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                },
              )
            ],
          ),
        ));
  }
}
