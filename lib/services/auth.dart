import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_diary/models/user.dart';
import 'package:personal_diary/services/create_database.dart';
import 'package:personal_diary/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TheUser FirebaseUser(User user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  Stream<TheUser> get user {
    return _auth.authStateChanges().map(FirebaseUser);
  }

  //Sign In Anonymously
  Future SignInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return FirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String emailId, String passwords) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: emailId, password: passwords);
      User user = result.user;

      CreateDatabase(email: emailId).Create();

      return FirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign Out
  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
