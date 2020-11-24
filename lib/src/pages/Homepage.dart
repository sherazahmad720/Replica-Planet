import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:karobar/src/controllers/home_controller.dart';
import 'package:karobar/src/pages/ItemCard.dart';
import 'package:karobar/src/widgets/featured_list_widget.dart';
import 'package:karobar/src/widgets/item_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karobar/src/widgets/slider.dart';
import 'package:karobar/src/models/product_model.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ProductDetails.dart';
import 'package:karobar/src/widgets/FeatureHeading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    homeController.getCategoryList();
    homeController.getNewArival();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                    onTap: () {
                      for (var i = 0; i <= _.categoryList.length; i++) {
                        FirebaseFirestore.instance
                            .collection("Product_Category")
                            .add({
                          'catId': _.categoryList[i].catId,
                          'name': _.categoryList[i].name,
                          'imgPath': _.categoryList[i].imgPath,
                          //
                        });
                      }
                    },
                    child: Icon(Icons.access_time)),
                backgroundColor: Colors.white,
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _.getHotSaleList();
                      _.getCategoryList();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.g_translate_outlined),
                    onPressed: () {
                      _.getCategoryList();
                    },
                  ),
                  IconButton(
                      onPressed: () async {
                        for (var i = 0; i <= _.allproducts.length; i++) {
                          FirebaseFirestore.instance
                              .collection("Products")
                              .add({
                            'id': _.allproducts[i].id,
                            'title': _.allproducts[i].title,
                            "price": _.allproducts[i].price,
                            "size": _.allproducts[i].size,
                            "description": _.allproducts[i].description,
                            "category": _.allproducts[i].category,
                            "featurePhoto": _.allproducts[i].featurePhoto,
                            "addingDate": _.allproducts[i].addingDate,
                            "flatDiscount": _.allproducts[i].flatDiscount,
                            "onSaleProduct": _.allproducts[i].onSaleProduct,
                            "percentageDiscount":
                                _.allproducts[i].percentageDiscount,
                            "prodComments": _.allproducts[i].prodComments,
                            "totalRating": _.allproducts[i].totalRating,
                            "prodRating": _.allproducts[i].prodRating,
                            "prodpic": _.allproducts[i].prodpic,
                            "color": _.allproducts[i].color.toString(),
                          });
                          print('uploaded');
                        }
                      },
                      icon: FaIcon(FontAwesomeIcons.shoppingCart))
                ],
              ),
              body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                        itemCount: _.productCategory.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"))),
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
                                    _.productCategory[i].name,
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
                    FeatureHeading(
                      Heading: "Hot Sale",
                      Path: ProductDetails,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FeatureListWidget(
                      navigationPath: ProductDetails,
                      products: _.newArivalList,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FeatureHeading(
                      Heading: "Recmonded",
                      Path: ProductDetails,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FeatureListWidget(
                      navigationPath: ProductDetails,
                      products: _.newArivalList,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FeatureHeading(
                      Heading: "New Arrival",
                      Path: ProductDetails,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FeatureListWidget(
                      navigationPath: ProductDetails,
                      products: _.newArivalList,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ])));
        });
  }
}
