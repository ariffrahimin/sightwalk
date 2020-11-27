import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference profileCollection = FirebaseFirestore.instance.collection('profile');

  Future updateUserData(String sugars, String name, int strength) async{
    return await profileCollection.doc(uid).set({
      'sugars': sugars,
      'name' : name,
      'strength': strength,
    });
  }

  //get profile stream
  Stream<QuerySnapshot> get profile {
    return profileCollection.snapshots();
  }
}