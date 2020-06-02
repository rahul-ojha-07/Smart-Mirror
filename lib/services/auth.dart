import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartMirror/models/user.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // create user based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) :null;
  }


  // auth change user state
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }



  // to sign in anonymously
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with username and password
  Future signInUser(String email,String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



  // register 







  // sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }



}



