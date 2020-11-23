import 'package:flutter/material.dart';
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
        // IconButton(
        //   icon: Icon(Icons.favorite),
        //   onPressed: () {},
        // ),
      ],
    );
  }
}
