import 'package:flutter/material.dart';
import 'text_field_container.dart';
import 'package:sightwalk/constants.dart';

class RoundPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator validator; //niii
  const RoundPasswordField({
    Key key,
    this.onChanged,
    this.validator, //niiii
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator, //niiii
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}