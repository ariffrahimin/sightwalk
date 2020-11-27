import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ProfileList extends StatefulWidget {
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<QuerySnapshot>(context);
    //print(profile.docs);
    for(var doc in profile.docs){
      print(doc.data());
    }
    return Container(
      
    );
  }
}