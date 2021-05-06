import 'package:mytripapp/View/loginScreen.dart';
import 'package:mytripapp/View/welcomeScreen.dart';
import 'package:mytripapp/View/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dart:async';

class WelcomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return welcomeScreenState();
  }
}

class welcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/backgroup.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Image(
                image: AssetImage('assets/img/logo3.png')))
      ),
    );
  }
}


