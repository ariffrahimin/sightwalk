import 'package:firebase_auth/firebase_auth.dart';
import 'package:sightwalk/models/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user object based on firebase user
  TheUser _userFromFirebaseUser(User user){
    return user != null ? TheUser(uid: user.uid) : null;
  }
  //auth change user stream
  Stream<TheUser> get user {
    return _auth.authStateChanges()
      .map(_userFromFirebaseUser);
}
  
  //sign-in anon
  Future signInAnon() async {
    try{
     UserCredential result = await _auth.signInAnonymously();
     User user = result.user;
     return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}