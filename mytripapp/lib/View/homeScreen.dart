import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class homeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return homeScreenState();
  }
}
class homeScreenState extends State<homeScreen> {

  List imgList = new List(3);

  @override
  void initState(){
    super.initState();
    DatabaseReference referenceData = FirebaseDatabase.instance.reference().child("Carousel Slider ");
    referenceData.once().then((DataSnapshot dataSnapShot){
      int x =0;
      var keys = dataSnapShot.value.keys;
      var values = dataSnapShot.value;
      for(var key in keys )
        {
         imgList[x] = values[key];
         x++;
        }
      setState(() {
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
          actions: [
            IconButton(
                icon: ClipOval(child: Image.asset("assets/img/download.jpg")),
                onPressed: (){} )
          ],

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
                height: MediaQuery.of(context).size.height*0.2,
                width: 600,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
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
                                height: MediaQuery.of(context).size.height*0.15,
                                width: 150,
                                child: Image.network("https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg",
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Text(
                            "testname",
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
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: Row(children: [
              //     Expanded(
              //       child: Text(
              //         "Most Recents",
              //         style: TextStyle(
              //           color: Colors.lightGreen[800],
              //           fontSize: 19,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ]),),
              // SizedBox(height: MediaQuery.of(context).size.height*0.012),
              // Container(
              //   height: MediaQuery.of(context).size.height*0.245,
              //   width: MediaQuery.of(context).size.width,
              //   child: GridView.builder(
              //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //
              //         maxCrossAxisExtent: 200,
              //
              //
              //
              //
              //       ),
              //       scrollDirection: Axis.vertical,
              //       itemCount: 10,
              //       itemBuilder: (context,index) {
              //         return Column(children: [
              //           InkWell(
              //             onTap: () {
              //               // Navigator.push(
              //               // context,
              //               //  MaterialPageRoute(
              //               //  builder: (_) =>
              //               //    Details(destinationList[index])),
              //               //  );
              //             },
              //             child: Padding(
              //               padding: const EdgeInsets.all(5.0),
              //               child: Container(
              //                 height: 120,
              //                 width: 200,
              //                 child: Image.network(
              //                     "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg",
              //                     fit: BoxFit.fill),
              //               ),
              //             ),
              //           ),
              //           Text(
              //             "testname",
              //             style: TextStyle(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.brown[900]),
              //           ),
              //         ]);
              //       }
              //   ),
              // )
            ],
          ),
        )




    );
  }

}

