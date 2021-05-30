import 'package:flutter/material.dart';
import 'package:mytripapp/Model/places.dart';
import 'package:mytripapp/View/infomationScreen.dart';
class detailsScreen extends StatefulWidget{
Place parentPlace;
detailsScreen(this.parentPlace);
  @override
  State<StatefulWidget> createState() {
    return detailsScreenState(parentPlace);
  }

}
class detailsScreenState extends State<detailsScreen>{
  Place parentPlace;
  detailsScreenState(this.parentPlace);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(parentPlace.name,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.lightGreen[900],),
          onPressed: (){
            Navigator.pop(context);
          },),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.3,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(parentPlace.img),
                    fit: BoxFit.cover)
            ),
          ),
          Padding(padding: EdgeInsets.only(
              top:MediaQuery.of(context).size.height*0.03,
          bottom:MediaQuery.of(context).size.height*0.03,
           left:20 ),

            child: Text("List of Places",style: TextStyle(color: Colors.lightGreen[900],fontSize: 18,fontWeight: FontWeight.bold),),

          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.49,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context,index){
                  return InkWell( child:
                  Row(

                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                        child:
                        Container(
                          height: 115,
                          width: 150,
                          child: Image.network(details[index].img,
                              fit: BoxFit.fill),
                        ),),
                      Column(
                        children: [
                          Text("Destination",style: TextStyle(fontSize: 13),),
                          SizedBox(height: 7,),
                          Text(
                            details[index].name,
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
                              Text(details[index].locate,style: TextStyle(fontSize: 10),),
                            ],
                          )
                        ],
                      ),


                    ],
                  ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                infomationScreen(details[index]) ),
                      );
                    },
                  );
                }),
          ),

        ],
      ),
    );
  }

}