import 'package:flutter/material.dart';
import 'package:sightwalk/services/auth.dart';
import 'package:sightwalk/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../profile_list.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().profile,
          child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: ProfileList(),
        
      ),
    );
  }
}