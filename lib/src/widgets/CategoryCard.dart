import 'package:karobar/main.dart';
import 'package:flutter/material.dart';
import 'package:karobar/src/controllers/home_controller.dart';
import 'package:karobar/src/models/category_model.dart';
import 'package:get/get.dart';
import 'package:karobar/src/pages/prouctList.dart';

class CategoryCard extends StatelessWidget {
  final HomeController home = Get.put(HomeController());
  final String img, name, id;
  CategoryCard({this.id, this.img, this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //idhr us method ko calll karna hy na
        home.getSortedProductList(name);
        Get.to(ProductList());
      },
      child: Card(
        child: Container(
          width: 100,
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                        img,
                      )),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  child: Container(
                      height: 30,
                      width: 50,
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "ShopNow",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
