import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sightwalk/Screens/wrapper.dart';
import 'package:sightwalk/models/user.dart';
import 'package:sightwalk/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:sightwalk/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}
