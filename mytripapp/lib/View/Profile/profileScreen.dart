import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:mytripapp/Controller/app.dart';
import 'package:mytripapp/Controller/auth_service.dart';
import 'package:mytripapp/View/Login/loginScreen.dart';
import 'package:mytripapp/View/Profile/updatePass.dart';
import 'package:mytripapp/View/Profile/updateProfileImageScreen.dart';
import 'package:provider/provider.dart';
import 'package:mytripapp/View/bottomNavigationBar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return profileScreenState();
  }
}
String imgUrl = "https://st3.depositphotos.com/18428194/32746/i/1600/depositphotos_327468620-stock-photo-panaji-india-december-15-2019.jpg";
class profileScreenState extends State<ProfileScreen> {
 final auth = FirebaseAuth.instance;
 final storage = FirebaseStorage.instance;
 File _image;
 String ImageUrl;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20,10,20,0),
        alignment: AlignmentDirectional.topStart,
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: <Widget>[
                    imageProfile(context),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("UID: "+ auth.currentUser.uid,
                            style: TextStyle(
                              color: Colors.lightGreen[800],
                              fontSize: 12,
                          )),
                        ),

                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                Image(
                    image: AssetImage("assets/img/ic_line.png"),
                  ),
                Text("Mail",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                Text(auth.currentUser.email,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.005,
                ),
                Image(
                  image: AssetImage("assets/img/ic_line.png"),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // TextButton(onPressed: (){
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => updatePassScreen()));
                      // },
                      //     child: Text(
                      //       "Update Password",
                      //       style: TextStyle(
                      //           color: Colors.lightGreen[700],
                      //           fontSize: 16
                      //       ),
                      //     )),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => updatePassScreen()));
                      },
                          child: Text(
                            "Update Password",
                            style: TextStyle(
                              color: Colors.lightGreen[700],
                              fontSize: 16
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.15,
                  ),
                  Center(
                    child: SizedBox(
                      width: 170,
                      height: 60,
                      child: RaisedButton(
                          color: Color(0xff33691e),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(80))),
                          onPressed: (){
                            SelectedPage(0);
                            context.read<AuthenticationService>().signOut();


                          },
                          child: Text("Log out",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25),)
                      ),
                    ),
                  ),
              ]
          ),
        ),
      ),
    );
  }

 Future<void> createDialog(BuildContext context){

   return showDialog(context: context, builder:(context){
     return AlertDialog(
       title: Text("Choose your avatar"),
       actions: <Widget>[
         MaterialButton(
             elevation: 5.0,
             child: Text("Choose Image"),
             onPressed: () async {
               getImage();
             }),
         SizedBox(width: 35,),
         MaterialButton(
             elevation: 5.0,
             child: Text("Save"),
             onPressed: (){
                 uploadFile();
             })
       ],
     );
   });
 }

 Future getImage() async {
   final result = await ImagePicker.pickImage(source: ImageSource.gallery);
   if(result==null) return;

   setState(()=>_image=File(result.path));
 }
 Future uploadFile() async{

Reference ref = FirebaseStorage.instance.ref();
UploadTask uploadTask =  ref.child(auth.currentUser.uid.toString()+".jpg").putFile(_image);
var ImageUrl = await(await uploadTask).ref.getDownloadURL();


setState(() {
  imgUrl =ImageUrl.toString();
});

 }



  Widget imageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          InkWell(
            onTap: (){
            createDialog(context);
            },
            child:
          Container(
              width: MediaQuery.of(context).size.width*0.4,
              height: MediaQuery.of(context).size.width*0.4,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 10))
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imgUrl),
                  ))),)
        ],
      ),
    );
  }
}





