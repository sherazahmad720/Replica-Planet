import 'package:flutter/material.dart';
// import 'package:karobar/main.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;
  Color color;
  SliderModel({this.imageAssetPath, this.title, this.desc, this.color});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  void setColor(Color getColor) {
    color = getColor;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }

  Color getColor() {
    return color;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Delegant Natural taste ");
  sliderModel.setTitle("FRIES");
  sliderModel.setImageAssetPath("assets/Ecomone.json");
  sliderModel.setColor(Color(0XFFF7BC26));
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("The Bread In New Ways");
  sliderModel.setTitle("Burger");
  sliderModel.setImageAssetPath("assets/Ecomtwo.json");
  sliderModel.setColor(Color(0xFFD82426));
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("All Luxurious Taste in Town");
  sliderModel.setTitle("Pizza");
  sliderModel.setImageAssetPath("assets/Ecomthree.json");
  sliderModel.setColor(Colors.yellow);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
