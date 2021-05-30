import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytripapp/Model/Utils/appUtils.dart';
import 'package:mytripapp/Model/places.dart';
import 'choosePlaces.dart';
class createTripScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return createTripScreenState();
  }

}
class createTripScreenState extends State<createTripScreen>{
  List<Place> fchoosePlace=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close),color: Colors.black,)],
        elevation: 0,
      ),
      body: Center(
        child:
        Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width*0.97,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,

            children:[

          Text("Destination",style: TextStyle(fontSize: 23,color: Colors.lightGreen[900],backgroundColor: Colors.white70,fontWeight: FontWeight.bold),),
          SizedBox(height: MediaQuery.of(context).size.height*0.005,),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height*0.77,
                width: MediaQuery.of(context).size.width,
        child:
        ListView.builder(
          scrollDirection: Axis.vertical,
            itemCount: fchoosePlace.length,
            itemBuilder: (context,index){
            return Column(
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Padding(
               padding:const EdgeInsets.symmetric(horizontal: 12.0),
             child:
            Container(
               height: 115,
               width: 150,
               child: Image.network(fchoosePlace[index].img,
                   fit: BoxFit.fill),
             ),),
             Column(
               children: [
                 Text("Destination",style: TextStyle(fontSize: 13),),
                 SizedBox(height: 7,),
                 Text(
                   fchoosePlace[index].name,
                   style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.w600,
                       color: Colors.brown[900]),
                 ),
                 SizedBox(height: 7,),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Icon(Icons.place,size: 18,color: Colors.lightGreen[900],),
                     Text(fchoosePlace[index].locate,style: TextStyle(fontSize: 10),),
                   ],
                 )
               ],
             ),

             IconButton(icon: Icon(Icons.cancel),onPressed: (){setState(() {
               fchoosePlace.removeAt(index);
             });},)
           ],
            ),
                SizedBox(height: 15,),


              ]);
            }
            ),
              ),
           Center(
               child:Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children:[
              TextButton(

                onPressed: (){
                 _navigateAndDisplaySelection(context);
                },
                child: Text("Choose"),
                style: TextButton.styleFrom(

                  side: BorderSide(color: Colors.black,width: 0.7),
                  fixedSize: Size(150, 40),

                ),
              ),
                 TextButton(

                   onPressed: (){
                     Navigator.pop(context,fchoosePlace);
                   },
                   child: Text("Create",style: TextStyle(color: Colors.white),),
                   style: TextButton.styleFrom(
                     backgroundColor: Colors.lightGreen[900],
                     side: BorderSide(color: Colors.lightGreen[900],width: 0.7),
                     fixedSize: Size(150, 40),

                   ),
                 ),
               ]
               )
           )
            ]
              )
             )
      )
    );
  }
  _navigateAndDisplaySelection(BuildContext context) async {
   final result =  await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) =>
              chooseScreen() ),
    );
   if(result != null){
     setState(() {
       fchoosePlace=result;
     });
   }
  }
}