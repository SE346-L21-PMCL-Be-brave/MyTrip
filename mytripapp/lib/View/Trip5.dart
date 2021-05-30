import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mytripapp/View/details.dart';
import 'package:mytripapp/View/placeWidget.dart';
import 'package:mytripapp/View/registerScreen.dart';
import 'package:mytripapp/Model/Utils/appUtils.dart';

class Trip5Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return trip5ScreenState();
  }
}
class trip5ScreenState extends State<Trip5Screen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Trip "+(appUtils.index+1).toString(),style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),),
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
         itemCount: appUtils.list.length,
         itemBuilder: (context, index) {
           return Column(
             children: [
               InkWell(
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (_) =>
                             detailsScreen(appUtils.list[index]) ),
                   );
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(


                     height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width*0.8,
                     child: Image.network(appUtils.list[index].img,
                       fit: BoxFit.fill
             ),
                   ),
                 ),
               ),
               Text(
                 appUtils.list[index].name,
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
