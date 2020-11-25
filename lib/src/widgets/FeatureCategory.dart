import 'package:karobar/main.dart';
import 'package:flutter/material.dart';
import 'package:karobar/src/models/category_model.dart';
import 'package:karobar/src/widgets/categoryCard.dart';

class FeatureCategory extends StatelessWidget {
  List<CategoryModel> category;
  FeatureCategory({this.category});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.blue),
        child: ListView.builder(
          itemCount: category.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) {
            return CategoryCard(
              name: category[i].name,
              img: category[i].imgPath,
              id: category[i].catId,
            );
          },
        ),
      ),
    );
  }
}
