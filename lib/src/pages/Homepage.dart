import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:karobar/src/controllers/home_controller.dart';
import 'package:karobar/src/pages/ItemCard.dart';
import 'package:karobar/src/widgets/item_card.dart';

import 'package:karobar/src/widgets/slider.dart';
import 'package:karobar/src/models/product_model.dart';

import 'ProductDetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // void initState() {

  // }
  // HomeController homeC = Get.put(HomeController());
  var rating = 3.0;
  // String _search;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                leading: Icon(Icons.access_time),
                backgroundColor: Colors.white,
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.shoppingCart))
                ],
              ),
              body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    //whatsapp bhi check kar leta banda
                    // Padding(
                    //     padding: EdgeInsets.only(top: 10),
                    //     child: CustomTextFieldSearch(
                    //       onSaved: (input) {
                    //         _search = input;
                    //       },
                    //       icon: Icon(Icons.email),
                    //       hint: "Search",
                    //       prefixicon: Icon(Icons.access_alarm),
                    //     )),
                    SizedBox(
                      height: 15,
                    ),
                    Banners(),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: _.categoryList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    //whats app p bhi dehan do zara
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/bag_1.png"))),
                                    height: 200,
                                    width: 200,
                                  ),
                                ),
                                Positioned(
                                  top: 120,
                                  left: 4,
                                  right: 0,
                                  bottom: 0,
                                  child: Text(
                                    _.categoryList[i].name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  top: 155,
                                  left: 30,
                                  right: 0,
                                  bottom: 0,
                                  child: Text("Shop now"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "See More",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hot Sale",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff707070)),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward,
                                color: Color(0xff707070)),
                            onPressed: () {
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //is pory ko bhi baad main widget bnana hy tek hy na
                    //ok h
                    Container(
                      height: 260,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: _.hoteSaleList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            return InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => ProductDetails(
                                  //               product: products[i],
                                  //             )));
                                },
                                child: ItemCardMain(
                                  description: "abc des",
                                  imgPath: "assets/images/bag_1.png",
                                  name: _.hoteSaleList[i].title,
                                  price: "100",
                                  rating: 2,
                                ));
                          }),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Arrival",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff707070)),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward,
                                color: Color(0xff707070)),
                            onPressed: () {
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //is pory ko bhi baad main widget bnana hy tek hy na
                    //ok h
                    Container(
                      height: 260,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: _.newArivalList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                                product: products[i],
                                              )));
                                },
                                child: ItemCardMain(
                                  description: "abc des",
                                  imgPath: "assets/images/bag_1.png",
                                  name: _.newArivalList[i].title,
                                  price: "100",
                                  rating: 2,
                                ));
                          }),
                    ),
                  ])));
        });
  }
}
