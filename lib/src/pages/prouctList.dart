import 'package:get/get.dart';
import 'package:karobar/main.dart';
import 'package:flutter/material.dart';
import 'package:karobar/src/controllers/home_controller.dart';
import 'package:karobar/src/pages/ItemCard.dart';
import 'package:karobar/src/widgets/item_card.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: Container(
        child: GetBuilder<HomeController>(builder: (_) {
          return Container(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
                itemCount: _.sortedproductList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, i) {
                  return
                      // Container(
                      //   width: 100,
                      //   height: 100,
                      //   color: Colors.red,
                      //   child: Text(i.toString()),
                      // );
                      //value pass kar do saria nend bht arhi kl krly baqi ?
                      ItemCardMain(
                          name: _.sortedproductList[i].title,
                          description: _.sortedproductList[i].description,
                          price: _.sortedproductList[i].price.toString(),
                          imgPath: _.sortedproductList[i].featurePhoto,
                          rating: 3.5);
                  //yhan pass karo
                }),
          ));
        }),
      ),
    );
  }
}
