import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ItemCardMain extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final double rating;
  final imgPath;
  // final String name;
  // final String name;
  ItemCardMain(
      {this.name, this.description, this.price, this.rating, this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10),
        child: Container(
          // height: 170,
          width: 200,
          child: Card(
            color: Color(0XFF3D81AF),
            elevation: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: '{products[i].id}',
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(imgPath))),
                      height: 114,
                      width: 180,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text("$name",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SmoothStarRating(
                          rating: rating,
                          isReadOnly: false,
                          size: 15,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
                          defaultIconData: Icons.star_border,
                          starCount: 5,
                          allowHalfRating: true,
                          spacing: 2.0,
                          onRated: (value) {
                            print("rating value -> $value");
                            // print("rating value dd -> ${value.truncate()}");
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "$description",
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 10,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$price pkr",
                        style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        "$price pkr",
                        style: TextStyle(fontSize: 14),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          return null;
                        },
                      ),
                      // IconButton(
                      //   icon: Icon(Icons.shopping_cart_outlined),
                      //   onPressed: () {
                      //     return null;
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
