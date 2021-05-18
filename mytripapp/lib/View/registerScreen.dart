import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mytripapp/View/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerScreenState();
  }
}

class registerScreenState extends State<RegisterScreen> {

  bool _eyeText1 = true;
  bool _eyeText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.lightGreen[900]),
        elevation: 0,
      ),
        body: Container(
          alignment: AlignmentDirectional.bottomCenter,
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                //----------------------------LOGO-----------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,0),
                  child: Image(
                    width: 90,
                    height: 90,
                    image: AssetImage('assets/img/logo2.png'),
                  ),
                ),
                //----------------------------EMAIL------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "Email",
                      //labelStyle: TextStyle(color: Color(0xff888888),fontSize: 60)
                    ),),
                ),
                //----------------------------USERNAME------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "Username",
                      //labelStyle: TextStyle(color: Color(0xff888888),fontSize: 60)
                    ),),
                ),
                //------------------------PASSWORD----------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  //padding: EdgeInsets.symmetric(horizontal: 4,vertical: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    obscureText: _eyeText1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                              _eyeText1? Icons.visibility : Icons.visibility_off),
                          onPressed: (){
                            setState(() {
                              _eyeText1 = !_eyeText1;
                            });//setState
                          },//onPressed
                        ),
                        labelStyle: TextStyle(color: Color(0xff888888),fontSize: 15)
                    ),),
                ),
                //------------------------CONFIRM PASSWORD----------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                  //padding: EdgeInsets.symmetric(horizontal: 4,vertical: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    obscureText: _eyeText2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: "Confirm Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                              _eyeText2? Icons.visibility : Icons.visibility_off),
                          onPressed: (){
                            setState(() {
                              _eyeText2 = !_eyeText2;
                            });//setState
                          },//onPressed
                        ),
                        labelStyle: TextStyle(color: Color(0xff888888),fontSize: 15)
                    ),),
                ),
                //---------------------------REGISTER----------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 70),
                  child: SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: RaisedButton(
                        color: Color(0xff33691e),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        onPressed: onLoginClicked,
                        child: Text("Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20),)
                    ),
                  ),
                ),
                //-----------------------LOGIN NOW------------------
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: RichText(
                        text: TextSpan(
                            text: "Already have a MyTravel account?",
                            style: TextStyle(color: Colors.grey[600], fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap=() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                text: " Log in now",
                                style: TextStyle(color: Colors.lightGreen[800], fontSize: 12),
                              )
                            ]
                        )
                    )
                ),
              ],
            ),
          ),
        ),
    );
  }

  void onLoginClicked() {
  }
}

