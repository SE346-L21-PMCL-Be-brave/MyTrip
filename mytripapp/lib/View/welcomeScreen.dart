import 'package:flutter/material.dart';

class welcomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return welcomeScreenState();

  }

}
class welcomeScreenState extends State<welcomeScreen>{
  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       image: DecorationImage(
         image: AssetImage('lib/img/wcimg.png'),
         fit: BoxFit.cover,
       ),
     color: Colors.green,
     ),
   );



  }
  
}