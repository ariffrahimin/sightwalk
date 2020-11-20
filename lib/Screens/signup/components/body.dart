import 'package:flutter/material.dart';
import 'package:sightwalk/Screens/login/login.dart';
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
  final _formKey = GlobalKey<FormState>();

  //text field state
  String username = '';
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
          key: _formKey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('lib/asset/images/logo.png'),
            height: size.height*0.2,
            ),
            SizedBox(
              height: size.height*0.05,
              ),
            RoundInputField(
              hintText: 'Username',
              icon: Icons.person,
              onChanged: (value) {},
            ),
            RoundInputField(
              hintText: 'Email',
              icon: Icons.email,
              onChanged: (value) {},
            ),
            RoundPasswordField(
              onChanged: (value){},
            ),
            SizedBox(height: size.height*0.1,
            ),
            RoundedButton(
              text: 'SIGN UP',
              press: () async{
                if(_formKey.currentState.validate()){
                  print(email);
                  print(password);
                }
              },
              textColor: Colors.black,
              color: kPrimaryLightColor,
            ),
            ExistAccount(
              login: false,
              press: (){
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) {
                     return LoginScreen();
                   },)
                   );
              },
              ),


          ],
        ),
      ),
      
    );
  }
}