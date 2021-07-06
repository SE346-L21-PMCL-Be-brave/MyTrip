import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytripapp/Controller/auth_service.dart';
import 'package:mytripapp/View/Trip5.dart';
import 'package:mytripapp/View/Login/loginScreen.dart';
import 'package:mytripapp/View/Login/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:mytripapp/View/bottomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'package:mytripapp/View/homeScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(create: (_)=>AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
            create: (context)=>context.read<AuthenticationService>().authStateChanges,
            )
      ] ,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationWrapper(),
    ),);
  }
}
class AuthenticationWrapper extends StatelessWidget{
  const AuthenticationWrapper({
    Key key,
}): super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return navigationBar();
    }
    else {

      return LoginScreen();
    }
  }
}



