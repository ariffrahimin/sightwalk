import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sightwalk/Screens/home/home.dart';
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
  String email = '';
  String password = '';
  String error = '';
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
        child: Form(
        key: _formKey,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('lib/asset/images/logo.png'),
            height: size.height*0.2,
            ),
            SizedBox(
              height: size.height*0.05,
              ),
            RoundInputField(
              validator: (_email)=>_email.isEmpty ? 'Enter an email' : null,
              hintText: 'Email',
              icon: Icons.email,
              onChanged: (_email) {
                setState(() {
                  email = _email;
                });
              },
            ),
            RoundPasswordField(
              validator: (value) => value.length<6 ? 'Enter a password 6+ chars long' : null,
              onChanged: (value) {
                setState(() {
                  password =value;
                });
              },
            ),
            SizedBox(height: size.height*0.1,
            ),
            RoundedButton(
              text: 'SIGN UP',
              press: () async{
                   // check the form for empty spots and validity
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email);
                      if (emailValid) {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                              Fluttertoast.showToast(
                              msg: "Logging in",
                              backgroundColor: Colors.green,
                              textColor: Colors.black,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              fontSize: 16
                            );
                          print(result);
                          
                          if (result == null) {
                            setState(() => error = 'Write a valid email');
                          }
                          else{
                            setState(() {
                              error = ('no error signing in');
                              print (error);
                              //make the sign up screen dissapear
                              Navigator.pop(context); 
                            });
                          }
                        }
                      } else {
                        setState(
                            () => error = 'Write a valid email');
                      }
              },
              textColor: Colors.black,
              color: kPrimaryLightColor,
            ),
            SizedBox(height: 12,
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14),
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
      ),
      
    );
  }
}