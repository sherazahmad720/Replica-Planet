import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:karobar/src/widgets/mainScreen.dart';
// import 'package:karobar/src/widgets/IntroductionScreen.dart';
// import 'src/pages/login.dart';
// import 'package:karobar/src/pages/Signup.dart';
// import 'package:karobar/src/pages/Homepage.dart';

void main() {
  runApp(MyApp());
}

// mobile py chaaty ho ? mobile hy //aur mehman a gay .!!!!!!!:_(ctx,i){mehman }
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        hintColor: Color(0xFFC0F0E8),
        primaryColor: Color(0xFF80E1D1),
        fontFamily: "Montserrat",
      ),
      debugShowCheckedModeBanner: false,
      // home: Home(),
      home: MainScreen(),
    );
  }
}
//ok color dy lo? kya?
