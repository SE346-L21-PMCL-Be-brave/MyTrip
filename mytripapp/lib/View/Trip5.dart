import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mytripapp/Model/places.dart';
import 'package:mytripapp/View/details.dart';
import 'package:mytripapp/View/placeWidget.dart';
import 'package:mytripapp/View/Login/registerScreen.dart';


class Trip5Screen extends StatefulWidget{
  String name;
  List<Place> data;
  Trip5Screen({this.name,this.data});
  @override
  State<StatefulWidget> createState() {
    return trip5ScreenState(name: name, data: data);
  }
}
class trip5ScreenState extends State<Trip5Screen> {
  String name;
  List<Place> data;
  trip5ScreenState({this.name,this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(name,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.lightGreen[900],),
          onPressed: (){
            Navigator.pop(context);
          },),
        elevation: 0,
      ),
   body: Container(
     color: Colors.white,
     height: MediaQuery.of(context).size.height*0.9,
     width: MediaQuery.of(context).size.width,

     child: ListView.builder(
         scrollDirection: Axis.vertical,
         itemCount: data.length,
         itemBuilder: (context, index) {
           return Column(
             children: [
               InkWell(
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (_) =>
                             detailsScreen(data[index]) ),
                   );
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(


                     height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width*0.8,
                     child: Image.network(data[index].img,
                       fit: BoxFit.fill
             ),
                   ),
                 ),
               ),
               Text(
                 data[index].name,
                 style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.w600,
                     color: Colors.brown[900]),
               ),
             ],
           );
         }),


   ),




    );
  }

}
