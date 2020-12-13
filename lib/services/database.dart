import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference profileCollection = FirebaseFirestore.instance.collection('profile');

  Future updateUserData(int age, String name, int phone_no) async{
    return await profileCollection.doc(uid).set({
      'age': age,
      'name' : name,
      'phone_no': phone_no,
    });
  }

  //get profile stream
  Stream<QuerySnapshot> get profile {
    return profileCollection.snapshots();
  }
}