import 'package:karobar/src/pages/login.dart';
import 'package:lottie/lottie.dart';

import 'package:karobar/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:karobar/src/models/Data.dart';
import 'package:after_layout/after_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Shared extends StatefulWidget {
  @override
  _SharedState createState() => _SharedState();
}

class _SharedState extends State<Shared> with AfterLayoutMixin<Shared> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginPage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SlideTile(
                imagePath: mySLides[0].getImageAssetPath(),
                title: mySLides[0].getTitle(),
                desc: mySLides[0].getDesc(),
                color: mySLides[0].getColor(),
              ),
              SlideTile(
                imagePath: mySLides[1].getImageAssetPath(),
                title: mySLides[1].getTitle(),
                desc: mySLides[1].getDesc(),
                color: mySLides[1].getColor(),
              ),
              SlideTile(
                imagePath: mySLides[2].getImageAssetPath(),
                title: mySLides[2].getTitle(),
                desc: mySLides[2].getDesc(),
                color: mySLides[2].getColor(),
              )
            ],
          ),
        ),
        bottomSheet: slideIndex != 2
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        controller.animateToPage(2,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "SKIP",
                        style: TextStyle(
                            color: Color(0xFF0074E4),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            i == slideIndex
                                ? _buildPageIndicator(true)
                                : _buildPageIndicator(false),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        print("this is slideIndex: $slideIndex");
                        controller.animateToPage(slideIndex + 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            color: Color(0xFF0074E4),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Container(
                  height: Platform.isIOS ? 70 : 60,
                  color: Color(0xFFF7BC26),
                  alignment: Alignment.center,
                  child: Text(
                    "GET STARTED NOW",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        fontFamily: 'Cuprum'),
                  ),
                ),
              ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;
  Color color;

  SlideTile({this.imagePath, this.title, this.desc, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20),
      // alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: color,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 30,
            left: MediaQuery.of(context).size.width / 2 - 200,
            right: 0,
            bottom: 0,
            child:
                Lottie.asset(imagePath, repeat: false, height: 500, width: 500),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width / 2 - 30,
            left: MediaQuery.of(context).size.width / 2 - 80,
            right: 0,
            bottom: 0,
            child: TyperAnimatedTextKit(
                isRepeatingAnimation: false,
                speed: Duration(milliseconds: 500),
                pause: Duration(milliseconds: 5000),
                onTap: () {
                  print("Tap Event");
                },
                text: [title],
                textStyle: TextStyle(fontSize: 70.0, fontFamily: "Satisfy"),
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width / 2 + 100,
            left: MediaQuery.of(context).size.width / 2 - 120,
            right: 0,
            bottom: 0,
            child: Text(
              desc,
              style: TextStyle(
                  fontFamily: 'cuprum', fontSize: 30, color: Colors.white),
            ),
          ),
        ],
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     Lottie.asset(imagePath,repeat: false,height: 400,width: 500),
      //     // Image.asset(imagePath),
      //     SizedBox(
      //       height: 40,
      //     ),
      //     Text(title, textAlign: TextAlign.center,style: TextStyle(
      //         fontWeight: FontWeight.w500,
      //         fontSize: 20
      //     ),),
      //     SizedBox(
      //       height: 20,
      //     ),
      //     Text(desc, textAlign: TextAlign.center,style: TextStyle(
      //         fontWeight: FontWeight.w500,
      //         fontSize: 14))
      //   ],
      // ),
    );
  }
}
