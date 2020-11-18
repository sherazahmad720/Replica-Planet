import 'package:flutter/material.dart';
import 'src/pages/login.dart';
import 'package:karobar/src/pages/Signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        hintColor: Color(0xFFC0F0E8),
        primaryColor: Color(0xFF80E1D1),
        fontFamily: "Montserrat",
      ),
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
//ok color dy lo? kya?
