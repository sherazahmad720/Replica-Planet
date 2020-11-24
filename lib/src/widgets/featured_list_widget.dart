import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karobar/src/models/product_model.dart';
import 'package:karobar/src/pages/ProductDetails.dart';
import 'package:karobar/src/widgets/item_card.dart';

class FeatureListWidget extends StatelessWidget {
  final navigationPath;
  final List<ProductModel> products;
  FeatureListWidget({this.navigationPath, this.products});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) {
            return InkWell(
                onTap: () {
                  Get.to(navigationPath(
                    product: products[i],
                  ));
                },
                child: ItemCardMain(
                  description: products[i].description,
                  imgPath: products[i].featurePhoto,
                  name: products[i].title,
                  price: products[i].price.toString(),
                  rating: 2,
                ));
          }),
    );
  }
}
