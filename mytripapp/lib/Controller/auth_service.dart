

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
  final auth= FirebaseAuth.instance;
  final refDatabase = FirebaseDatabase.instance.reference();
  Future<String> signIn({String email,String pass}) async {

    try {
       await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: pass
      );

      await refDatabase.child("User").once().then((DataSnapshot dataSnapShot){
        var keys= dataSnapShot.value.keys;
        var values = dataSnapShot.value;
        int x =0;
        for(var key in keys){
            if(key== auth.currentUser.uid.toString()){
              x++;
            }
          }
        if(x==0){
          refDatabase.child("User").child(auth.currentUser.uid.toString()).child("imageProfile").set("http://www.darylroththeatre.com/wp-content/uploads/2018/10/avatar-placeholder.png");
        }
      });
      //await refDatabase.child("User").child(auth.currentUser.uid.toString()).child("imageProfile").set("http://www.darylroththeatre.com/wp-content/uploads/2018/10/avatar-placeholder.png");
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
      ).then((user) async {
        User firebaseUser = FirebaseAuth.instance.currentUser;
        await firebaseUser.sendEmailVerification();
      });
      Fluttertoast.showToast(
          msg: "Register success! Check your email to verify.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
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
// class FirebaseApi {
//   static UploadTask uploadImage(String destination, File image){
//     try {
//       final ref = FirebaseStorage.instance.ref(destination);
//       return ref.putFile(image);
//     } on FirebaseException catch(e){
//       return null;
//     }
//   }
// }