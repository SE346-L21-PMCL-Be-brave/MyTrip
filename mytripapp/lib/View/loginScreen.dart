import 'package:flutter/material.dart';
class loginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return loginScreenState();
  }

}
class loginScreenState extends State<loginScreen>{
  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       image: DecorationImage(
         image: AssetImage('lib/img/loginbgimg.png'),
         fit: BoxFit.cover,
         colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
       ),
     ),
   );
  }

}