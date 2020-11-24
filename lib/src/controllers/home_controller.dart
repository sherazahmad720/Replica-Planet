import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karobar/src/models/slider_model.dart';
import 'package:karobar/src/models/product_model.dart';
import 'package:karobar/src/models/category_model.dart';

class HomeController extends GetxController {
  //here is home page code
  List<SliderModel> bannerList = [];
  List<CategoryModel> categoryList = [
    CategoryModel(imgPath: "assets/images/0.png", name: "Cat1", CatId: 0),
    CategoryModel(imgPath: "assets/images/0.png", name: "Cat2", CatId: 1),
    CategoryModel(imgPath: "assets/images/0.png", name: "Cat3", CatId: 2)
  ];
  List<ProductModel> hoteSaleList = [
    ProductModel(
        id: 1,
        title: "Office Code",
        price: 234,
        size: 12,
        description: dummyText,
        image: "IMAGE",
        color: Color(0xFF3D82AE)),
    ProductModel(
        id: 2,
        title: "Belt Bag",
        price: 234,
        size: 8,
        description: dummyText,
        image: "IMAGE",
        color: Color(0xFFD3A984)),
    ProductModel(
        id: 3,
        title: "Hang Top",
        price: 234,
        size: 10,
        description: dummyText,
        image: "IMAGE",
        color: Color(0xFF989493)),
  ];
  List<ProductModel> newArivalList = [
    ProductModel(
        id: 4,
        title: "Old Fashion",
        price: 234,
        size: 11,
        description: dummyText,
        image: "IMAGE",
        color: Color(0xFFE6B398)),
    ProductModel(
        id: 5,
        title: "Office Code",
        price: 234,
        size: 12,
        description: dummyText,
        image: "IMAGE",
        color: Color(0xFFFB7883)),
    ProductModel(
      id: 6,
      title: "new Mobile",
      price: 234,
      size: 12,
      description: dummyText,
      image: "IMAGE",
      color: Color(0xFFAEAEAE),
    ),
  ];

  getBanerList() {}
  getCategoryList() {}
  getHotSaleList() {}
  getNewArival() {}
}
