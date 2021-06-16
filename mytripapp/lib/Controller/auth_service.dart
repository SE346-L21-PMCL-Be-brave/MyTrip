

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mytripapp/View/bottomNavigationBar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email,String pass}) async {
    try {
       await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: pass
      );
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
class FirebaseApi {
  static UploadTask uploadImage(String destination, File image){
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(image);
    } on FirebaseException catch(e){
      return null;
    }
  }
}