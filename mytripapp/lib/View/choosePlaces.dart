import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytripapp/Model/Utils/appUtils.dart';
import 'package:mytripapp/Model/places.dart';
import 'package:mytripapp/Model/CheckBoxPlaceModel.dart';
import 'package:mytripapp/View/createTrip.dart';
class chooseScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return chooseScreenState();
  }

}
class chooseScreenState extends State<chooseScreen>{
  List<Place> availablePlace=[
    Place(name: "Ho Chi Minh",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
    Place(name: "Vung Tau",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
    Place(name: "Nha Trang",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
    Place(name: "Sa Pa",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
    Place(name: "Da Lat",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
    Place(name: "Vinh",locate: "noway",img:  "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg"),
  ];
  List<CheckBoxModel> checkList=[];
  void changePlacelistToCheckList(List<Place> list, List<CheckBoxModel> checklist){
    for(var i=0;i<list.length;i++){
   CheckBoxModel model=   CheckBoxModel(title: list[i].name,location: list[i].locate);
      checklist.add(model);
    }
  }
  List<Place> choseItem=[];
  void addChoseItem(List<Place> choseList,List<CheckBoxModel> checkList,List<Place> avaiList){
    for(var i=0;i<checkList.length;i++){
      if(checkList[i].value==true){
        choseList.add(avaiList[i]);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    changePlacelistToCheckList(availablePlace, checkList);
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      actions: [IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close),color: Colors.black,)],
      elevation: 0,
    ),
  body:Column(
    children: [
      Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height*0.77,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: availablePlace.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: Checkbox(
                value: checkList[index].value,
                  onChanged: (value){
                  setState(() {
                    checkList[index].value=!checkList[index].value;
                  });
                  },
                ),
              title: Row(
                  children:[
                    Icon(Icons.place,color: Colors.lightGreen[900],),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children:[

                Text(checkList[index].title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                Text(availablePlace[index].locate,style: TextStyle(fontSize: 13),),
                ])
                  ]),
              );
            },
            ),
      ),
      SizedBox(height: 15,),
      Center(
          child:
          TextButton(

            onPressed: (){
              addChoseItem(choseItem, checkList, availablePlace);


              Navigator.pop(context,choseItem);

            },
            child: Text("Add",style: TextStyle(color: Colors.white),),
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightGreen[900],
              side: BorderSide(color: Colors.lightGreen[900],width: 0.7),
              fixedSize: Size(200, 40),

            ),
          ))
    ],

  )
  );
  }

}