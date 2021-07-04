import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mytripapp/Controller/auth_service.dart';
import 'package:mytripapp/View/Login/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerScreenState();
  }
}

class registerScreenState extends State<RegisterScreen> {

  bool _eyeText1 = true;
  bool _eyeText2 = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final refDatabase = FirebaseDatabase.instance.reference();





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        alignment: AlignmentDirectional.bottomCenter,
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
              children: <Widget> [
          //----------------------------LOGO-----------------------------
          Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hintText: "Email",
              //labelStyle: TextStyle(color: Color(0xff888888),fontSize: 60)
            ),
          ),
        ),
        //------------------------PASSWORD----------------------------
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
          //padding: EdgeInsets.symmetric(horizontal: 4,vertical: 10),
          child: TextField(
            style: TextStyle(color: Colors.black),
            obscureText: _eyeText1,
            controller: passController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                      _eyeText1 ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _eyeText1 = !_eyeText1;
                    }); //setState
                  }, //onPressed
                ),
                labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15)
            ),
            ),
        ),
        //------------------------CONFIRM PASSWORD----------------------------
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
          //padding: EdgeInsets.symmetric(horizontal: 4,vertical: 10),
          child: TextField(
            style: TextStyle(color: Colors.black),
            obscureText: _eyeText2,
            controller: confirmPassController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hintText: "Confirm Password",
                suffixIcon: IconButton(
                  icon: Icon(
                      _eyeText2 ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _eyeText2 = !_eyeText2;
                    }); //setState
                  }, //onPressed
                ),
                labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15)
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  onPressed: (){
                    String email=emailController.text.trim();
                    String pass=passController.text.trim();
                    String confirmPass=confirmPassController.text.trim();
                    if(EmailValidator.validate(email)) {
                      if(pass==confirmPass && pass.length>6){
                        context.read<AuthenticationService>().signUp(
                            email: emailController.text.trim(),
                    pass: passController.text.trim());
                        Fluttertoast.showToast(
                            msg: "Register success! Please login.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "Your confirm password is incorrect.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    }
                    else{
                     Fluttertoast.showToast(
                          msg: "Invalid email!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }

                  },
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
                        ..onTap = () {
                          Navigator.pop(
                              context);
                          context.read<AuthenticationService>().signOut();
                        },

                      text: " Log in now",
                      style: TextStyle(
                          color: Colors.lightGreen[800], fontSize: 12),
                    )
                  ]
              )
          )
      ),
      ],
    ),)
    ,
    )
    ,
    );
  }

}



