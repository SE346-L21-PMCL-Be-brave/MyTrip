import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytripapp/Model/places.dart';

import 'details.dart';
import 'infomationScreen.dart';





class homeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return homeScreenState();
  }
}
class homeScreenState extends State<homeScreen> {

 List<String> imgList = ["https://p.kindpng.com/picc/s/195-1957108_road-map-icon-png-transparent-png.png",
   "https://p.kindpng.com/picc/s/195-1957108_road-map-icon-png-transparent-png.png",
     "https://p.kindpng.com/picc/s/195-1957108_road-map-icon-png-transparent-png.png"];
 List<Place> hotTrending =[];
 List<Place> mostRecent =[];
 String imgProfile;
  @override
  void initState(){
    super.initState();
    initCarousel();
    initHotTrending();
    initMostRecent();


  }
void initCarousel(){
  DatabaseReference referenceData = FirebaseDatabase.instance.reference().child("Carousel Slider ");
  referenceData.once().then((DataSnapshot dataSnapShot){
    setState(() {
      int x =0;
      var keys = dataSnapShot.value.keys;
      var values = dataSnapShot.value;
      for(var key in keys )
      {
        imgList[x] = values[key];
        x++;
      }

    });
  });
}
void initHotTrending(){
  DatabaseReference placeData = FirebaseDatabase.instance.reference().child("Hot Trending");
  placeData.once().then((DataSnapshot dataSnapShot){
    hotTrending.clear();
    var keys = dataSnapShot.value.keys;
    var values = dataSnapShot.value;
    for(var key in keys){
      Place data = new Place(
          name: key,
          locate: values[key]['Locate'],
          img: values[key]['Image']
      );
      hotTrending.add(data);
    }
    setState(() {
      //
    });
  });
}
void initMostRecent(){
  DatabaseReference placeData = FirebaseDatabase.instance.reference().child("Most Recent");
  placeData.once().then((DataSnapshot dataSnapShot){
    mostRecent.clear();
    var keys = dataSnapShot.value.keys;
    var values = dataSnapShot.value;
    for(var key in keys){
      Place data = new Place(
          name: key,
          locate: values[key]['Address'],
          img: values[key]['Image'],
        detail: values[key]['Detail']

      );
      mostRecent.add(data);
    }
    setState(() {
      //
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          title: Text("My Travel",style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),),
          backgroundColor: Colors.white,

        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              CarouselSlider(
                  items: imgList.map((imgURL) {
                    return Builder(
                        builder: (BuildContext context){
                          return Container(
                            width: MediaQuery.of(context).size.width,

                            child: Image.network(
                              imgURL,
                              fit: BoxFit.fill,

                            ),
                          );
                        });
                  }).toList(),

                  height: MediaQuery.of(context).size.height*0.28,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch:  Duration(seconds: 10),

              ),




              SizedBox(height: MediaQuery.of(context).size.height*0.012,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  Expanded(
                    child: Text(
                      "Hot Trending",
                      style: TextStyle(
                        color: Colors.lightGreen[800],
                        fontSize: 19,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),

                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.215,
                width: 600,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotTrending.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => detailsScreen(
                                     hotTrending[index], )),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.15,
                                width: 150,
                                child: Image.network(hotTrending[index].img,
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Text(
                            hotTrending[index].name,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.brown[900]),
                          ),
                        ],
                      );
                    }),

              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.012),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  Expanded(
                    child: Text(
                      "Most Recent",
                      style: TextStyle(
                        color: Colors.lightGreen[800],
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),),
              SizedBox(height: MediaQuery.of(context).size.height*0.012),
              Container(
                height: MediaQuery.of(context).size.height*0.24,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width*0.6,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: mostRecent.length,
                    itemBuilder: (context,index) {
                      return Column(children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      infomationScreen(mostRecent[index]) ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 120,
                              width: 200,
                              child: Image.network(
                                  mostRecent[index].img,
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child:
                           Text(
                          mostRecent[index].name,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.brown[900]),
                        ),)
                      ]);
                    }
                ),
              )
            ],
          ),
        )




    );
  }

}


