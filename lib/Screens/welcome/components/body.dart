import 'package:flutter/material.dart';
import 'package:sightwalk/Screens/login/login.dart';
import 'package:sightwalk/Screens/signup/signup.dart';
import 'package:sightwalk/components/round_button.dart';

class Body extends StatelessWidget {

const Body({
  Key key,
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/asset/images/background.png',
          ),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('lib/asset/images/logo.png'),),
            Image(image: AssetImage('lib/asset/images/footsteps.png'),),
            
            RoundedButton(
              text: "SIGN UP",
              press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SignUpScreen();
                  },));
              },),
            RoundedButton(
              text: "LOGIN",
              press: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                },));
              },)
          ],
        ),)
    );
  }
}