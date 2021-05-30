import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../bottomNavigationBar.dart';

class updateProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return updateProfileScreenState();
  }
}

class updateProfileScreenState extends State<updateProfileScreen> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20,0,20,0),
        alignment: AlignmentDirectional.topStart,
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                    imageProfile(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,0,0,10),
                          child: Text("MyTripApp",
                              style: TextStyle(
                                color: Colors.lightGreen[800],
                                fontSize: 22,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,0,0,0),
                          child: Text("ID: 123456",
                              style: TextStyle(
                                color: Colors.lightGreen[800],
                                fontSize: 22,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Image(
                  image: AssetImage("assets/img/ic_line.png"),
                ),
                Image(
                  image: AssetImage("assets/img/ic_line.png"),
                ),
                TextField(
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "",
                    hintStyle: TextStyle(
                      fontSize: 30,
                    ),
                    labelText: "Phone",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: SizedBox(
                    width: 170,
                    height: 100,
                    child: RaisedButton(
                        color: Color(0xff33691e),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(80))),
                        onPressed: (){
                          SelectedPage(2);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => navigationBar()));
                        },
                        child: Text("Save",
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
  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 140,
            height: 140,
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
                    image: _imageFile == null
                    ? AssetImage("assets/img/background.png")
                    : FileImage(File(_imageFile.path)),
                    ))),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  color: Colors.green,
                ),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}

