import 'package:flutter/material.dart';
import 'package:sightwalk/components/text_field_container.dart';
import 'package:sightwalk/constants.dart';

class RoundInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged, Icon prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
        icon :Icon(
          icon,
          color: kPrimaryColor,
        ),
          hintText: hintText, 
          border: InputBorder.none,
        ),
        //neww comment
      ),
    );
  }
}