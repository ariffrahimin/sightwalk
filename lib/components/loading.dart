import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: SpinKitPouringHourglass(
          color: Colors.black,
          size: 100,
          duration: Duration(milliseconds: 1500),
        ),
      ),
    );
  }
}
