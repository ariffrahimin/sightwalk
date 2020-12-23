import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  final String name;
  final String age;
  final String phoneNo;
  Edit({Key key, @required this.name, this.age, this.phoneNo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(name),
      ),
    );
  }
}
