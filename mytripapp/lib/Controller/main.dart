import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mytripapp/Controller/app.dart';
import 'package:mytripapp/View/Trip5.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
