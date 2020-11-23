// import 'package:karobar/main.dart';
import 'package:flutter/material.dart';
import 'package:karobar/src/models/User.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SeeMore extends StatefulWidget {
  @override
  _SeeMoreState createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 0.75),
          itemBuilder: (ctx, i) {
            return Container(
                height: 300,
                width: 205,
                child: Card(
                  color: Color(0XFF3D81AF),
                  elevation: 10.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/0.png'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                  height: 50,
                                  width: 100,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text("Elo is Elo",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  )),
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Logo is Effcient Cool and Cold",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "12",
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            "\$8.89",
                            style: TextStyle(
                                fontSize: 22,
                                decoration: TextDecoration.lineThrough),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite),
                            onPressed: () {
                              return null;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart_outlined),
                            onPressed: () {
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )

                // },
                // ),
                );
          },
        ),
      ),
    );
  }
}
