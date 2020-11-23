import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sightwalk/Screens/signup/signup.dart';
import 'package:sightwalk/components/exist_acount.dart';
import 'package:sightwalk/components/round_button.dart';
import 'package:sightwalk/components/round_input_field.dart';
import 'package:sightwalk/components/round_password_field.dart';
import 'package:sightwalk/constants.dart';
import 'package:sightwalk/services/auth.dart';
import 'package:sightwalk/components/loading.dart';

class Body extends StatefulWidget {


  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String username = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading ? Loading() : Container(
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
        child: Form(
          key: _formKey,
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
              validator: (_email)=>_email.isEmpty ? 'Enter an email' : null,
              hintText: 'Email',
              icon: Icons.email,
              onChanged: (value){
                setState(() {
                  email = value;
                });
              },
            ),
            RoundPasswordField(
              validator: (value) => value.length<6 ? 'Enter a password 6+ chars long' : null,
              onChanged: (value){
                setState(() {
                  password = value;
                });
              },
            ),
            
            RoundedButton(
              text: 'LOGIN',
              press: ()async{
                          
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth.signinWithEmailAndPassword(email, password);
                          Fluttertoast.showToast(
                              msg: "Logging in",
                              backgroundColor: Colors.green,
                              textColor: Colors.black,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              fontSize: 16
                            );
                          if(result == null){
                            setState(() {
                              error = 'Could not sign in with these credentials';
                              loading = false;
                            });
                          }else{
                            Navigator.pop(context);
                            //comment here
                          }
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
      ),
      
    );
  }
}