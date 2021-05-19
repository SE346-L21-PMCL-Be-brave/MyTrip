import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mytripapp/View/registerScreen.dart';
class Trip5Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return trip5ScreenState();
  }
}
class trip5ScreenState extends State<Trip5Screen> {
  int _selectedPage =0;
  final _pageOption =[
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
    Text('Item 4')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Trip",style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.lightGreen[900],),),
        elevation: 0,
      ),
   body:
        Container(
     child: ListView( children: <Widget> [
       
     ],

     )
   ),

    );
  }

}
