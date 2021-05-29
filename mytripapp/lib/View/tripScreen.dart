

import 'package:flutter/material.dart';
import 'package:mytripapp/Model/Utils/appUtils.dart';
import 'package:mytripapp/Model/places.dart';
import 'package:mytripapp/View/Trip5.dart';
import 'package:mytripapp/Model/Utils/appUtils.dart';
class TripScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return TripScreenState();
  }
}

class TripScreenState extends State<TripScreen> {







  final GlobalKey _floatingKey= new GlobalKey();
  Size floatingSize;
  Offset floatingLocation= new Offset(10, 450);
  void getFloatingSize(){
    RenderBox floatingBox= _floatingKey.currentContext.findRenderObject();
    floatingSize= floatingBox.size;
  }
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=> getFloatingSize());
  }
  void onDragUpdate(BuildContext context,DragUpdateDetails details){
    final RenderBox box = context.findRenderObject();
    final Offset offset = box.globalToLocal(details.globalPosition);
    final double startX= 0;
    final double endX= context.size.width-floatingSize.width;
    final double startY= MediaQuery.of(context).padding.top;
    final double endY= context.size.height*0.85-floatingSize.height;
    if(startX<offset.dx&&offset.dx<endX){
      if(startY<offset.dy&&offset.dy<endY){
        setState(() {
          floatingLocation=new Offset(offset.dx,offset.dy);
        });
      }

    }
  }
  void onDragEnd(BuildContext context,DragEndDetails details){
  final double pointX=context.size.width/2;
  if(floatingLocation.dx<pointX){
    setState(() {
      floatingLocation=new Offset(10, floatingLocation.dy);
    });
  }
  else{
    setState(() {
      floatingLocation = new Offset(context.size.width-floatingSize.width-10, floatingLocation.dy);
    });
  }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text("Your Trip",style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),),
      centerTitle: true,
      elevation: 0,
    ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.9,
          child:
      GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details)=> onDragUpdate(context,details),
        onHorizontalDragUpdate: (DragUpdateDetails details)=> onDragUpdate(context,details),
        onVerticalDragEnd: (DragEndDetails details)=> onDragEnd(context,details),
        onHorizontalDragEnd: (DragEndDetails details)=> onDragEnd(context,details),

        child: Stack(
          children: [
            ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: Trip.trip.length,
    itemBuilder: (context, indexx) {
      return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(children: [
            Expanded(
              child: Text(
                "Trip "+(indexx+1).toString(),
                style: TextStyle(
                  color: Colors.lightGreen[800],
                  fontSize: 19,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            TextButton(

                child:Text(
              "View All",
              style: TextStyle(
                color: Colors.lightGreen[800],
                fontSize: 15,
              ),
            ),
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: (){
                  appUtils.index=indexx;
                  appUtils.list=Trip.trip[indexx];
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>Trip5Screen()));
              },
            ),
          ]),
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.2,
          width: 600,

          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        // context,
                        //  MaterialPageRoute(
                        //  builder: (_) =>
                        //    Details(destinationList[index])),
                        //  );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 115,
                          width: 150,
                          child: Image.network(Trip.trip[indexx][index].img,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Text(
                      Trip.trip[indexx][index].name,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.brown[900]),
                    ),
                  ],
                );
              }),


        ),
      ],
      );
    },
        ),
            Positioned(
                child: FloatingActionButton.extended(
                    key: _floatingKey,
                    icon: Icon(Icons.add_circle_outlined, color: Colors.white,size: 30,),
                    backgroundColor: Colors.lightGreen[900],
                    onPressed: null,

                    label: Container(
                  child: Column(
                      children: [Text("New",style: TextStyle(color: Colors.white),),
                                 Text("Trip",style: TextStyle(color: Colors.white),),
                  ]
                  )
                )
                ),
              left: floatingLocation.dx,
              top: floatingLocation.dy,
            )
          ]
        ),
      )),
    );
  }
}