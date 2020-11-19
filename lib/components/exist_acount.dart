import 'package:flutter/material.dart';

class ExistAccount extends StatelessWidget {
  final bool login;
  final Function press;
  const ExistAccount({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account ?" : "Already have an Account ? ",
          style: TextStyle(color: Colors.blueGrey),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Login",
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}