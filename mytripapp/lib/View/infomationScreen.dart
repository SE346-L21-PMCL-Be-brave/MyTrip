import 'package:flutter/material.dart';
import 'package:mytripapp/Model/places.dart';
class infomationScreen extends StatefulWidget{
  Place parentPlace;
  infomationScreen(this.parentPlace);
  @override
  State<StatefulWidget> createState() {
    return infomationScreenState(parentPlace);
  }

}
class infomationScreenState extends State<infomationScreen>{
  Place parentPlace;
  infomationScreenState(this.parentPlace);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.lightGreen[900],),
          onPressed: (){
            Navigator.pop(context);
          },),
        elevation: 0,
      ),
      body: Column
        (
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
            top:MediaQuery.of(context).size.height*0.02,

            left:20 ),

          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text(parentPlace.name,style: TextStyle(color: Colors.lightGreen[900],fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Text("Info"),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Text("Location"),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Text(parentPlace.locate,style: TextStyle(color: Colors.lightGreen[900],fontSize: 12,),),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Padding(padding: EdgeInsets.only(right: 10.0),
              child:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(child:
            Text("Once you have written and are happy with your topic sentence, you can start to fill in the rest of your paragraph. This is where the detailed, well-structured notes you wrote earlier will come in handy. Make sure that your paragraph is coherent, which means that it is easy to read and understand, that each sentence connects with the next and that everything flows nicely as a whole. To achieve this, try to write clear, simple sentences that express exactly what you want to say."))
          ))])

        ),
      ],),
    );
  }

}