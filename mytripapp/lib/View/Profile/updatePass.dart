import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
final TextEditingController passController = TextEditingController();
final TextEditingController newPassController= TextEditingController();
final TextEditingController confirmPassController = TextEditingController();
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
                controller: passController,
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
                controller: newPassController,
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
                controller: confirmPassController,
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
                     Navigator.pop(context);
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      String pass = passController.text.toString();
                      String newPass= newPassController.text.toString();
                      String confirmPass= confirmPassController.text.toString();
                      validateInfo(pass,newPass,confirmPass,context);
                      },
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

void validateInfo(String pass,String newPass, String confirmPass ,BuildContext context) {
  if(pass!=""&&newPass!=""&&confirmPass!=""){
  if(pass.length>6&& newPass.length>6){
    if(newPass==confirmPass){
        changePass(pass,newPass,context);
    }
    else{
      Fluttertoast.showToast(
          msg: "Please validate your new password",
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
        msg: "Invalid Password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }}
  else{
    Fluttertoast.showToast(
        msg: "Please fill out all field",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}

Future<void> changePass(String pass, String newPass,BuildContext context) async {
  bool result;
  final auth= FirebaseAuth.instance;
  final User = auth.currentUser;
  var authCredentials = EmailAuthProvider.credential(email: User.email, password: pass);
  await User.reauthenticateWithCredential(authCredentials).then((value) {
    if(value!=null) result =true;


  }).catchError((error){
    Fluttertoast.showToast(
        msg: "Current Password Incorrect",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  });
  if(result==true){
    User.updatePassword(newPass).then((_) {
      Fluttertoast.showToast(
          msg: "Change Password Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pop(context);
    }).catchError((error){
      Fluttertoast.showToast(
          msg: "Change Password Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
  }
  else{
    Fluttertoast.showToast(
        msg: "Current Password Incorrect",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
