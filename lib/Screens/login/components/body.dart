import 'package:flutter/material.dart';
import 'package:sightwalk/Screens/signup/signup.dart';
import 'package:sightwalk/components/exist_acount.dart';
import 'package:sightwalk/components/round_button.dart';
import 'package:sightwalk/components/round_input_field.dart';
import 'package:sightwalk/components/round_password_field.dart';
import 'package:sightwalk/constants.dart';
import 'package:sightwalk/services/auth.dart';

class Body extends StatefulWidget {


  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/asset/images/cream.jpg'
          ),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('lib/asset/images/logo.png'
            ),
            height: size.height*0.2,
            ),
            SizedBox(
              height: size.height*0.1,
            ),
            RoundInputField(
              hintText: 'Username',
              icon: Icons.person,
              onChanged: (value){},
            ),
            RoundPasswordField(
              onChanged: (value){},
            ),
            RoundedButton( 
              text: 'Anonymous Log In',
              press: () async{
               dynamic result = await _auth.signInAnon();
               if (result == null){
                 print('error signing in');
               }else{
                 print('signed in');
                 print(result);
               }
              },
              textColor: Colors.black,
              color: kPrimaryLightColor,
            ),
            RoundedButton(
              text: 'LOGIN',
              press: (){},
              textColor: Colors.black,
              color: kPrimaryLightColor,
            ),
            ExistAccount(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      
    );
  }
}