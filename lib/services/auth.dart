import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartMirror/models/user.dart';
import 'package:smartMirror/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String uid = "x";
  // create user based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user state
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  String getUid(){
    return uid;
  }
  void setUid(String id){
    uid = id;
  }

  // to sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      // _uid = user.uid;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with username and password
  Future signInUser(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // uid = user.uid;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register

  Future signUpUser(String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // uid = user.uid;
      // create a new document for the user with new uid,name
      await DatabaseService(uid: user.uid)
          .updateUserData(user.uid,email,name, null, [], null, false);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      _userFromFirebaseUser(null);
      return null;
    }
  }

  // sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
