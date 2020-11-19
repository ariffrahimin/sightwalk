import 'package:flutter/material.dart';
import 'package:sightwalk/Screens/signup/signup.dart';
import 'package:sightwalk/components/exist_acount.dart';
import 'package:sightwalk/components/round_button.dart';
import 'package:sightwalk/components/round_input_field.dart';
import 'package:sightwalk/components/round_password_field.dart';
import 'package:sightwalk/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }): super(key: key);
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
            SizedBox(height: size.height*0.1,),
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