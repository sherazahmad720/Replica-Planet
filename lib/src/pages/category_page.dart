import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karobar/src/controllers/home_controller.dart';
import 'package:karobar/src/widgets/CategoryCard.dart';

// import 'package:karobar/src/';
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories"),
      ),
      body: Container(
        child: GetBuilder<HomeController>(builder: (_) {
          return Container(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
                itemCount: _.allCategoryList.length,
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

                      CategoryCard(
                          id: _.allCategoryList[i].catId,
                          img: _.allCategoryList[i].imgPath,
                          name: _.allCategoryList[i].name);
                }

                //          GridItemCard
                //               product: products[index],
                //               press: () => Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) => ProductDetails(
                //                       product: products[index],
                //                     ),
                //                   )),
                //             )
                //             ),
                //   ),
                // ),

                ),
          ));
        }),
      ),
    );
  }
}
