import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:karobar/src/controllers/home_controller.dart';
import 'package:karobar/src/pages/category_page.dart';

import 'package:karobar/src/widgets/featured_list_widget.dart';

import 'package:karobar/src/widgets/slider.dart';

import 'package:karobar/src/widgets/FeatureCategory.dart';
import 'ProductDetails.dart';
import 'package:karobar/src/widgets/FeatureHeading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    //idhr hi hon init satate dekh rha hon ok
    homeController.getFeaturedCategoryList();
    homeController.getHotSaleList();
  }

//yar splach screen sy initilize karwa len gy abi choro us ko next working kary
//next kyaaa
//baqi pages4
//kn sa ab acha mai btat hu
//yaha upr categroy name  show hngy or jb click kry gy aik category py to us sy related sari post show hjy gi
  @override
  Widget build(BuildContext context) {
    // homeController.getCategoryList();
    // homeController.getHotSaleList();
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          // homeController.getCategoryList();
          // homeController.getHotSaleList();
          return Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                    onTap: () {
                      for (var i = 0;
                          i <= _.categoryListForDataAdding.length;
                          i++) {
                        FirebaseFirestore.instance
                            .collection("ProductCategory")
                            .add({
                          'catId': _.categoryListForDataAdding[i].catId,
                          'name': _.categoryListForDataAdding[i].name,
                          'imgPath': _.categoryListForDataAdding[i].imgPath,
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
                      _.getFeaturedCategoryList();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.g_translate_outlined),
                    onPressed: () {
                      _.getFeaturedCategoryList();
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
                    FeatureHeading(
                      Heading: "Categories",
                      Path: ProductDetails,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FeatureCategory(
                      category: _.featuredCategoryList,
                    ),

                    // Padding(
                    //   padding: EdgeInsets.all(20),
                    //   child: Container(
                    //     height: 200,
                    //     width: MediaQuery.of(context).size.width,
                    //     decoration: BoxDecoration(color: Colors.blue),
                    //     child: ListView.builder(
                    //       itemCount: _.categoryList.length,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (ctx, i) {
                    //         return Padding(
                    //           padding: EdgeInsets.only(left: 10),
                    //           child: Stack(
                    //             children: [
                    //               Positioned(
                    //                 child: Container(
                    //                   height: 200,
                    //                   width: MediaQuery.of(context).size.width,
                    //                   decoration: BoxDecoration(
                    //                     image: DecorationImage(
                    //                         image: NetworkImage(
                    //                       _.categoryList[i].imgPath,
                    //                     )),
                    //                   ),
                    //                 ),
                    //               ),
                    //               Positioned(
                    //                 top: 30,
                    //                 child: Container(
                    //                     height: 30,
                    //                     width: 50,
                    //                     child: Text(
                    //                       _.categoryList[i].name,
                    //                       style: TextStyle(fontSize: 20),
                    //                     )),
                    //               ),
                    //               Positioned(
                    //                 top: 80,
                    //                 left: 0,
                    //                 child: Container(
                    //                     height: 50,
                    //                     width: 130,
                    //                     decoration: BoxDecoration(
                    //                         color: Colors.yellow,
                    //                         borderRadius:
                    //                             BorderRadius.circular(20)),
                    //                     child: Text(
                    //                       "ShopNow",
                    //                       style: TextStyle(fontSize: 20),
                    //                     )),
                    //               ),
                    //             ],
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   height: 200,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: ListView.builder(
                    //     itemCount: _.categoryList.length,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (ctx, i) {
                    //       return Padding(
                    //         padding: EdgeInsets.only(left: 20),
                    //         child: Stack(
                    //           children: [
                    //             // Positioned(
                    //             //   child: Container(
                    //             //     decoration: BoxDecoration(
                    //             //         color: Colors.blue,
                    //             //         image: DecorationImage(
                    //             //             image: NetworkImage(
                    //             //                 "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"))),
                    //             //     height: 200,
                    //             //     width: 200,
                    //             //   ),
                    //             // ),
                    //             Positioned(
                    //               top: 120,
                    //               left: 4,
                    //               right: 0,
                    //               bottom: 0,
                    //               child: Text(
                    //                 _.categoryList[i].name,
                    //                 style: TextStyle(
                    //                     fontSize: 20,
                    //                     fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //             Positioned(
                    //               top: 155,
                    //               left: 30,
                    //               right: 0,
                    //               bottom: 0,
                    //               child: Text("Shop now"),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _
                            .getAllCategoryList()
                            .then((value) => Get.to(CategoryPage()));
                      },
                      child: Text(
                        "See More",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
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
