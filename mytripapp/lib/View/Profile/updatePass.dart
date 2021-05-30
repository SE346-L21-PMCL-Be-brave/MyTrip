import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bottomNavigationBar.dart';


class updatePassScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return updatePassScreenState();
  }
}

class updatePassScreenState extends State<updatePassScreen> {
  bool _eyeText1 = true;
  bool _eyeText2 = true;
  bool _eyeText3= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        alignment: AlignmentDirectional.topStart,
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              TextField(
                style: TextStyle(
                  fontSize: 20,
                ),
                obscureText: _eyeText1,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          _eyeText1? Icons.visibility : Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          _eyeText1 = !_eyeText1;
                        });//setState
                      },//onPressed
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "",
                    hintStyle: TextStyle(
                      fontSize: 40,
                    ),
                    labelText: "Current Password",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
              TextField(
                style: TextStyle(
                  fontSize: 20,
                ),
                obscureText: _eyeText2,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          _eyeText2? Icons.visibility : Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          _eyeText2 = !_eyeText2;
                        });//setState
                      },//onPressed
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "",
                    hintStyle: TextStyle(
                      fontSize: 40,
                    ),
                    labelText: "New Password",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  helperText: "Password consist of characters, numbers and contains no special characters.",
                  helperMaxLines: 2,
                  helperStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                  )
                ),
              ),
              TextField(
                style: TextStyle(
                  fontSize: 20,
                ),
                obscureText: _eyeText3,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          _eyeText3? Icons.visibility : Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          _eyeText3 = !_eyeText3;
                        });//setState
                      },//onPressed
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "",
                    hintStyle: TextStyle(
                      fontSize: 40,
                    ),
                    labelText: "Confirm New Password",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
              SizedBox(
                height: 65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    onPressed: () {
                      SelectedPage(2);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => navigationBar()));
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
