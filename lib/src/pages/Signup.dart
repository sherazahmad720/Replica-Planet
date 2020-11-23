import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:karobar/main.dart';
import 'package:karobar/src/widgets/custom_paint.dart';
// import 'dart:ui' as ui;
import 'package:karobar/src/widgets/CustomTextField.dart';
// import 'package:karobar/src/widgets/EmailValidator.dart';
import 'package:karobar/src/widgets/FilledButton.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:async/src/';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _loading = false;
  Color color = Color(0XFF3A437D);

  String _email;
  String _password;
  String _confirmpassword;
  String _firstName;
  String _lastName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// var size = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: Get.width,
            height: 270,
            child: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: CustomPaint(
                  size: Size(Get.width,
                      100.0), //You can Replace this with your desired WIDTH and HEIGHT
                  painter: RPSCustomPainter(),
                ),
              ),
              Positioned(
                top: 45,
                left: 120,
                child: Align(
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              Positioned(
                child: Container(
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ]),
          ), //esko stack mai nh lkhna tha drmyan mai vo lgana g logo ?
          Container(
            height: 800,
            width: 800,
            decoration: BoxDecoration(color: Colors.white), //Done? yes
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: CustomTextField(
                        onSaved: (input) {
                          _firstName = input;
                        },
                        // validator: emailValidator,
                        icon: Icon(Icons.verified_user_sharp),
                        hint: "First Name",
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 27),
                      child: CustomTextField(
                        onSaved: (input) {
                          _lastName = input;
                        },
                        // validator: emailValidator,
                        icon: Icon(Icons.verified_user_sharp),
                        hint: "Last Name",
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 27),
                      child: CustomTextField(
                        onSaved: (input) {
                          _email = input;
                        },
                        // validator: emailValidator,
                        icon: Icon(Icons.email),
                        hint: "Email",
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 27),
                      child: CustomTextField(
                        icon: Icon(Icons.lock),
                        obsecure: true,
                        onSaved: (input) => _password = input,
                        validator: (input) =>
                            input.isEmpty ? "*Required" : null,
                        hint: "PASSWORD",
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 27),
                      child: CustomTextField(
                        icon: Icon(Icons.lock),
                        obsecure: true,
                        onSaved: (input) => _confirmpassword = input,
                        validator: (input) =>
                            input.isEmpty ? "*Required" : null,
                        hint: "Confirm PASSWORD",
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: _loading == true
                        ? CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Colors.amberAccent),
                          )
                        : Container(
                            child: filledButton(
                              "SIGNUP",
                              Colors.white,
                              Color(0XFF3A437D),
                              Color(0XFF3A437D),
                              Colors.white,
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Already Have An Account ?",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
