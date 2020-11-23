// import 'package:karobar/main.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  ProductModel({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<ProductModel> products = [
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
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "IMAGE",
    color: Color(0xFFAEAEAE),
  ),
];
String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry";
