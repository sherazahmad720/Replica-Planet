import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karobar/src/models/category_model.dart';
import 'package:karobar/src/models/slider_model.dart';
import 'package:karobar/src/models/product_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  //here is home page code
  List<SliderModel> bannerList = [];

  List<ProductModel> newArivalList = [];
  List<CategoryModel> allCategoryList = [];
  List<CategoryModel> featuredCategoryList = [];
  List<ProductModel> sortedproduct = [];

  getBanerList() {}
  Future<void> categoryproductlist() async {
    FirebaseFirestore.instance.collection("Products").get().then((qssShot) {
      sortedproduct.clear();
      sortedproduct = qssShot.docs
          .map((doc) => ProductModel(
              title: doc.data()['title'],
              description: doc.data()['description'],
              price: doc.data()['price'],
              totalRating: doc.data()['totalRating'],
              prodRating: doc.data()['productRating'],
              featurePhoto: doc.data()['featurePhoto']))
          .toList();
    });
    update();
  }

  Future<void> getAllCategoryList() async {
    FirebaseFirestore.instance
        .collection("ProductCategory")
        .get()
        .then((qsShot) {
      allCategoryList.clear();
      allCategoryList = qsShot.docs
          .map((doc) => CategoryModel(
                catId: doc.data()['catId'],
                name: doc.data()['name'],
                imgPath: doc.data()['imgPath'],
              ))
          .toList();
    });
    update();
  }

  Future<void> getFeaturedCategoryList() async {
    FirebaseFirestore.instance
        .collection("ProductCategory")
        .limit(4)
        .get()
        .then((qsShot) {
      featuredCategoryList.clear();
      featuredCategoryList = qsShot.docs
          .map((doc) => CategoryModel(
                catId: doc.data()['catId'],
                name: doc.data()['name'],
                imgPath: doc.data()['imgPath'],
              ))
          .toList();
    });
    update();
  }

  Future<void> getHotSaleList() async {
    FirebaseFirestore.instance.collection("Products").get().then((qShot) {
      newArivalList.clear();
      newArivalList = qShot.docs
          .map((doc) => ProductModel(
              title: doc.data()['title'],
              description: doc.data()['description'],
              price: doc.data()['price'],
              totalRating: doc.data()['totalRating'],
              prodRating: doc.data()['productRating'],
              featurePhoto: doc.data()['featurePhoto']))
          .toList();
    });
    update();
    print(newArivalList);
  }

  getNewArival() {}
  //temp code here
  List<ProductModel> hoteSaleList = [
    ProductModel(
        id: "1",
        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        price: 109,
        size: [
          {'Size': 'XL', 'priceDiffer': "33"},
          {'Size': 'XL', 'priceDiffer': "33"}
        ],
        description:
            "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        category: "men clothing",
        featurePhoto:
            "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        addingDate: DateTime.now(),
        flatDiscount: 0,
        onSaleProduct: 15,
        percentageDiscount: 4,
        prodComments: [],
        totalRating: 45,
        prodRating: 3,
        prodpic: [],
        color: [Colors.black, Colors.red, Colors.yellow]),
    ProductModel(
      totalRating: 33,
      id: "abc",
      title: "Office Code",
      price: 234,
      size: [
        {'Size': 'XL', 'priceDiffer': "33"},
      ],
      description: dummyText,
      featurePhoto: "IMAGE",
      addingDate: DateTime.now(),
      flatDiscount: 11,
      onSaleProduct: 45,
      percentageDiscount: 0,
      prodComments: [],
      prodRating: 4,
      prodpic: [],
      color: [Colors.black, Colors.red, Colors.yellow],
    ),
  ];

  //for data adding
  List<CategoryModel> categoryListForDataAdding = [
    CategoryModel(
        imgPath: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        name: "Cat2",
        catId: "1"),
    CategoryModel(
        imgPath:
            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        name: "Cat3",
        catId: "2"),
    CategoryModel(
        imgPath:
            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        name: "Cat1",
        catId: "0"),
  ];
  List<ProductModel> allproducts = [
    ProductModel(
      id: "1",
      title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      price: 2,
      size: [
        {'Size': 'XL', 'priceDiffer': "33"},
        {'Size': 'XL', 'priceDiffer': "33"}
      ],
      description:
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      category: "men clothing",
      featurePhoto: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      addingDate: DateTime.now(),
      flatDiscount: 0,
      onSaleProduct: 15,
      percentageDiscount: 4,
      prodComments: [],
      totalRating: 45,
      prodRating: 3,
      prodpic: [
        "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpets.webmd.com%2Fcats%2Fcat-vaccines&psig=AOvVaw0fvjFuPtSRwsZbKNjsBcUk&ust=1606323008489000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNi15OLRm-0CFQAAAAAdAAAAABAH",
        "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
      ],
      color: [Colors.black, Colors.red, Colors.yellow],
    ),
    ProductModel(
      id: "2",
      title: "Mens Casual Premium Slim Fit T-Shirts ",
      price: 2,
      size: [
        {'Size': 'XL', 'priceDiffer': "33"},
        {'Size': 'XL', 'priceDiffer': "33"}
      ],
      description:
          "lim-fitting style, contrast raglan long sleeve, three-button",
      category: "men clothing",
      featurePhoto: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      addingDate: DateTime.now(),
      flatDiscount: 10,
      onSaleProduct: 15,
      percentageDiscount: 4,
      prodComments: [],
      totalRating: 45,
      prodRating: 3,
      prodpic: [
        "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpets.webmd.com%2Fcats%2Fcat-vaccines&psig=AOvVaw0fvjFuPtSRwsZbKNjsBcUk&ust=1606323008489000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNi15OLRm-0CFQAAAAAdAAAAABAH",
        "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
      ],
      color: [Colors.black, Colors.blue, Colors.yellow],
    ),
    ProductModel(
      id: "3",
      title:
          "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet ",
      price: 67,
      size: [
        {'Size': 'small', 'priceDiffer': "23"},
        {'Size': 'XL', 'priceDiffer': "13"}
      ],
      description:
          "lim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
      category: "Men casual clothing",
      featurePhoto: "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
      addingDate: DateTime.now(),
      flatDiscount: 0,
      onSaleProduct: 22,
      percentageDiscount: 9,
      prodComments: [],
      totalRating: 34,
      prodRating: 5,
      prodpic: [
        "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpets.webmd.com%2Fcats%2Fcat-vaccines&psig=AOvVaw0fvjFuPtSRwsZbKNjsBcUk&ust=1606323008489000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNi15OLRm-0CFQAAAAAdAAAAABAH",
        "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
      ],
      color: [Colors.black, Colors.blue, Colors.yellow],
    ),
    ProductModel(
      id: "4",
      title: "Mens Cotton Jacket ",
      price: 2,
      size: [
        {'Size': 'small', 'priceDiffer': "23"},
        {'Size': 'XL', 'priceDiffer': "13"}
      ],
      description:
          "lim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
      category: "Men casual clothing",
      featurePhoto:
          "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
      addingDate: DateTime.now(),
      flatDiscount: 0,
      onSaleProduct: 22,
      percentageDiscount: 9,
      prodComments: [],
      totalRating: 34,
      prodRating: 5,
      prodpic: [
        "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpets.webmd.com%2Fcats%2Fcat-vaccines&psig=AOvVaw0fvjFuPtSRwsZbKNjsBcUk&ust=1606323008489000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNi15OLRm-0CFQAAAAAdAAAAABAH",
        "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
      ],
      color: [Colors.white, Colors.blue, Colors.yellow],
    ),
    ProductModel(
      id: "6",
      title: "Solid Gold Petite Micropave ",
      price: 899,
      size: [
        {'Size': 'small', 'priceDiffer': "23"},
        {'Size': 'XL', 'priceDiffer': "13"}
      ],
      description:
          "Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.",
      category: "jewelery",
      featurePhoto:
          "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
      addingDate: DateTime.now(),
      flatDiscount: 5,
      onSaleProduct: 20,
      percentageDiscount: 9,
      prodComments: [],
      totalRating: 50,
      prodRating: 8,
      prodpic: [],
      color: [Colors.white, Colors.blue, Colors.yellow],
    ),
  ];
}
