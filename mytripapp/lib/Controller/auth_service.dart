import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mytripapp/View/bottomNavigationBar.dart';
class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  static int codeLogin=0;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    codeLogin=0;
  }
  Future<String> signIn({String email,String pass}) async {
    try {
       await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: pass
      );
       codeLogin=1;
       Fluttertoast.showToast(
           msg: "Login success",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.TOP,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.grey,
           textColor: Colors.white,
           fontSize: 16.0
       );

       return "Signed In";
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: "Login Failed!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return e.message;
    }
  }
  Future<String> signUp({String email,String pass}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: pass
      );
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: "This email has used!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return e.message;
    }
  }
}