import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: SmoothStarRating(
            rating: 2.0,
            isReadOnly: false,
            size: 15,
            color: Colors.red,
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
        // IconButton(
        //   icon: Icon(Icons.favorite),
        //   onPressed: () {},
        // ),
      ],
    );
  }
}
