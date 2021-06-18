import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytripapp/Model/places.dart';
import 'package:mytripapp/View/infomationScreen.dart';
class detailsScreen extends StatefulWidget{
  Place place1;
  detailsScreen(this.place1);
// String name, img;
// detailsScreen(this.name, this.img);
  @override
  State<StatefulWidget> createState() {
    return detailsScreenState(place1);
  }

}
class detailsScreenState extends State<detailsScreen>{
  List<Place> details=[];

  Place place1;
  detailsScreenState(this.place1);

  void a(){

    DatabaseReference data = FirebaseDatabase.instance.reference().child("Place").child(place1.name).child('Site');
    data.once().then((DataSnapshot dataSnapShot){
      setState(() {
        details.clear();
        var keys = dataSnapShot.value.keys;
        var values = dataSnapShot.value;
        for(var key in keys)
        {
          Place data = new Place(
            name: key,
            locate: values[key]['Address'],
            img: values[key]['Image'],
            detail: values[key]['Detail'],
          );
          details.add(data);
        }
      });

    });
  }


  @override
  void initState() {
    super.initState();
    setState(() {
      a();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(place1.name,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.lightGreen[900],),
          onPressed: (){
            Navigator.pop(context);
          },),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.3,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(place1.img),
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
                itemCount: details.length,
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
                      Container(
                        height: 115,
                        width: MediaQuery.of(context).size.width -170,
                        child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text(details[index].locate,style: TextStyle(fontSize: 10,),maxLines: 3,),
                        ],
                      ),
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
      ),
    );
  }

}