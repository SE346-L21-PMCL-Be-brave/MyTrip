

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mytripapp/Controller/auth_service.dart';
import 'package:mytripapp/View/Login/registerScreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
  return loginScreenState();
  }
}

class loginScreenState extends State<LoginScreen>{
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passController = TextEditingController();
  bool _eyeText = true;
  final auth= FirebaseAuth.instance;
  Future<String> createDialog(BuildContext context){
    TextEditingController resetController= TextEditingController();
    return showDialog(context: context, builder:(context){
      return AlertDialog(
        title: Text("Your reset password Email?"),
        content: TextField(
          style: TextStyle(color: Colors.black),
          controller: resetController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            hintText: "Email",
          ),
        ),
        actions: <Widget>[
          MaterialButton(
              elevation: 5.0,
              child: Text("Send Request"),
              onPressed: (){
                Navigator.of(context).pop(resetController.text.toString().trim());
              })
        ],
      );
    });
  }

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
                      //-----------------LOGO----------------------------------
                     Padding(
                         padding: const EdgeInsets.fromLTRB(0,0,0,20),
                       child: Image(
                         image: AssetImage('assets/img/logo2.png'),
                       ),
                     ),
                //----------------------------USERNAME------------------------
                     Padding(
                       padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                       child: TextField(
                        style: TextStyle(color: Colors.black),
                        controller: emailController,
                        decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: "Email",
                       //labelStyle: TextStyle(color: Color(0xff888888),fontSize: 60)
                        ),),
                     ),
                  //------------------------PASSWORD----------------------------
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      //padding: EdgeInsets.symmetric(horizontal: 4,vertical: 10),
                      child: TextField(
                         style: TextStyle(color: Colors.black),
                         obscureText: _eyeText,
                         controller: passController,
                         decoration: InputDecoration(
                         border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                         hintText: "Password",
                          suffixIcon: IconButton(
                             icon: Icon(
                            _eyeText? Icons.visibility : Icons.visibility_off),
                             onPressed: (){
                              setState(() {
                            _eyeText = !_eyeText;
                            });//setState
                             },//onPressed
                          ),
                         labelStyle: TextStyle(color: Color(0xff888888),fontSize: 15)
                      ),),
                    ),
                      //-----------------FORGOT PASSWORD--------------------------------
                     Padding(
                       padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                        child: Container(
                           alignment: AlignmentDirectional.topEnd,
                           child: TextButton(
                              onPressed: (){
                                  createDialog(context).then((onValue){
                              auth.sendPasswordResetEmail(email: onValue).then((_) =>
                                  Fluttertoast.showToast(
                                  msg: "Request email has been sent",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              ));
                                  });
                              },
                               child: Text("Forgot Password?",
                               style: TextStyle(
                                 fontSize: 13,
                                 color: Colors.lightGreen[700],
                               ),),
                         ),
                       ),
                     ),
                 //---------------------------LOG IN----------------------------
                     Padding(
                       padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
                        child: SizedBox(
                          width: double.infinity,
                          height: 42,
                           child: RaisedButton(
                              color: Color(0xff33691e),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                              onPressed: () async {
                                final user = await auth.signInWithEmailAndPassword(
                                    email: emailController.text.trim(), password: passController.text.trim());
                                if(user.user.emailVerified){
                                context.read<AuthenticationService>().signIn(
                                  email: emailController.text.trim(),
                                  pass: passController.text.trim()
                                );
                                }else{
                                  auth.signOut();
                                  Fluttertoast.showToast(
                                      msg: "Please verified your account!!!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }

                              },
                              child: Text("Log In",
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20),)
                          ),
                        ),
                    ),
                      //-----------------------REGISTER HERE------------------
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(color: Colors.grey[600], fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                ..onTap=() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RegisterScreen()));
                                },
                                text: " Register here",
                                style: TextStyle(color: Colors.lightGreen[800], fontSize: 12),
                              )
                            ]
                          )
                        )
                      ),
                    ],
                ),
              ),
            )
          );
  }
}

// class loginScreenState extends State<loginScreen>{
//   @override
//   Widget build(BuildContext context) {
//    return Container(
//      decoration: BoxDecoration(
//        image: DecorationImage(
//          image: AssetImage('lib/img/loginbgimg.png'),
//          fit: BoxFit.cover,
//          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
//        ),
//      ),
//    );
//   }
//
// }