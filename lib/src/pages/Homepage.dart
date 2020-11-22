import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karobar/main.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:karobar/src/pages/SeeMore.dart';
import 'package:karobar/src/widgets/CustomFieldSearch.dart';
import 'package:karobar/src/widgets/CustomTextField.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:karobar/src/widgets/slider.dart';
import 'package:karobar/src/models/User.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'ProductDetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var rating = 3.0;
  String _search;
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {}, icon: FaIcon(FontAwesomeIcons.shoppingCart))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              width: 20,
                              height: 20,
                              child: Text('${products[i].title}'),
                              // decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //         image: NetworkImage(
                              //             "${products[i].image}"))),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "See More",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrival",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      return null;
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: 205,
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (ctx, i) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(ProductDetails(
                                rating: rating.toString(),
                                prodid: products[i].id.toString(),
                                prodname: products[i].title,
                                prodPrice: products[i].price.toString(),
                                proddescription: products[i].description));
                          },
                          child: Card(
                            color: Color(0XFF3D81AF),
                            elevation: 10.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Hero(
                                      tag: '${products[i].id}',
                                      child: Image.asset(products[i].image)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            height: 50,
                                            width: 100,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                  "${products[i].title}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            )),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SmoothStarRating(
                                          rating: rating,
                                          isReadOnly: false,
                                          size: 15,
                                          filledIconData: Icons.star,
                                          halfFilledIconData: Icons.star_half,
                                          defaultIconData: Icons.star_border,
                                          starCount: 5,
                                          allowHalfRating: true,
                                          spacing: 2.0,
                                          onRated: (value) {
                                            print("rating value -> $value");
                                            // print("rating value dd -> ${value.truncate()}");
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "${products[i].description}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${products[i].price}",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    Text(
                                      "\$${products[i].price}",
                                      style: TextStyle(
                                          fontSize: 22,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.favorite),
                                      onPressed: () {
                                        return null;
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.shopping_cart_outlined),
                                      onPressed: () {
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
