// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import '../bottomNavigationBar.dart';
//
// class updateProfileImageScreen extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return updateProfileImageScreenState();
//   }
// }
//
// class updateProfileImageScreenState extends State<updateProfileImageScreen> {
//   PickedFile _imageFile;
//   final ImagePicker _picker = ImagePicker();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//       ),
//       body: Container(
//         padding: const EdgeInsets.fromLTRB(20,0,20,0),
//         alignment: AlignmentDirectional.topStart,
//         constraints: BoxConstraints.expand(),
//         color: Colors.white,
//         child: SingleChildScrollView(
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                imageProfile(),
//
//
//
//                 SizedBox(
//                   height: 60,
//                 ),
//                 Center(
//                   child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children:[
//                    RaisedButton(
//                           color: Color(0xff33691e),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
//                           onPressed: (){
//                             SelectedPage(2);
//                             Navigator.of(context).push(
//                                 MaterialPageRoute(builder: (context) => navigationBar()));
//                           },
//                           child: Text("Save",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25),)
//                       ),
//
//
//                    RaisedButton(
//                         color: Color(0xff33691e),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
//                         onPressed: (){
//                           SelectedPage(2);
//                           Navigator.of(context).push(
//                               MaterialPageRoute(builder: (context) => navigationBar()));
//                         },
//                         child: Text("Save",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 25),)
//                     ),
//                  ])
//                 ),
//               ]
//           ),
//         ),
//       ),
//     );
//   }
//   Widget imageProfile() {
//     return Center(
//       child: Stack(
//         children: [
//           Container(
//             width: 140,
//             height: 140,
//             decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 4,
//                     color: Theme.of(context).scaffoldBackgroundColor),
//                 boxShadow: [
//                   BoxShadow(
//                       spreadRadius: 2,
//                       blurRadius: 10,
//                       color: Colors.black.withOpacity(0.1),
//                       offset: Offset(0, 10))
//                 ],
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: _imageFile == null
//                     ? AssetImage("assets/img/background.png")
//                     : FileImage(File(_imageFile.path)),
//                     ))),
//           Positioned(
//               bottom: 0,
//               right: 0,
//               child: Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     width: 4,
//                     color: Theme.of(context).scaffoldBackgroundColor,
//                   ),
//                   color: Colors.green,
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: ((builder) => bottomSheet()),
//                     );
//                   },
//                   child: Icon(
//                     Icons.edit,
//                     color: Colors.white,
//                   ),
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
//   Widget bottomSheet() {
//     return Container(
//       height: 100.0,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
//       ),
//       child: Column(
//         children: <Widget>[
//           Text(
//             "Choose Profile photo",
//             style: TextStyle(
//               fontSize: 20.0,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//             FlatButton.icon(
//               icon: Icon(Icons.camera),
//               onPressed: () {
//                 takePhoto(ImageSource.camera);
//               },
//               label: Text("Camera"),
//             ),
//             FlatButton.icon(
//               icon: Icon(Icons.image),
//               onPressed: () {
//                 takePhoto(ImageSource.gallery);
//               },
//               label: Text("Gallery"),
//             ),
//           ])
//         ],
//       ),
//     );
//   }
//
//   void takePhoto(ImageSource source) async {
//     final pickedFile = await _picker.getImage(
//       source: source,
//     );
//     setState(() {
//       _imageFile = pickedFile;
//     });
//   }
// }

