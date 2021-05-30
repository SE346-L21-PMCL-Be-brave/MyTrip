import 'package:flutter/material.dart';
import 'package:mytripapp/View/Login/loginScreen.dart';
import 'package:mytripapp/View/Profile/updatePass.dart';
import 'package:mytripapp/View/Profile/updateProfileScreen.dart';


class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return profileScreenState();
  }
}

class profileScreenState extends State<ProfileScreen> {

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
                  height: 30,
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
                  height: 30,
                ),
                Image(
                    image: AssetImage("assets/img/ic_line.png"),
                  ),
                Text("Mail",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                Text("xxx@gmail.com",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                ),),
                SizedBox(
                  height: 2,
                ),
                Image(
                  image: AssetImage("assets/img/ic_line.png"),
                ),
                Text("Phone",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                Text("",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30,
                  ),),
                SizedBox(
                 height: 2,
                 ),
                 Image(
                    image: AssetImage("assets/img/ic_line.png"),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => updatePassScreen()));
                      },
                          child: Text(
                            "Update Password",
                            style: TextStyle(
                                color: Colors.lightGreen[700],
                                fontSize: 18
                            ),
                          )),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => updateProfileScreen()));
                      },
                          child: Text(
                            "Update Profile",
                            style: TextStyle(
                              color: Colors.lightGreen[700],
                              fontSize: 18
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      width: 170,
                      height: 100,
                      child: RaisedButton(
                          color: Color(0xff33691e),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(80))),
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Text("Log In",
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
                      image: AssetImage("assets/img/background.png")
                  ))),
        ],
      ),
    );
  }
}

