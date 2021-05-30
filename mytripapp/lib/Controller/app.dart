import 'package:mytripapp/View/Trip5.dart';
import 'package:mytripapp/View/Login/loginScreen.dart';
import 'package:mytripapp/View/Login/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}



