import 'package:karobar/main.dart';
import 'Homepage.dart';
import 'package:flutter/material.dart';
import 'package:karobar/src/widgets/slider.dart';
import 'package:karobar/src/models/User.dart';
import 'package:karobar/src/pages/ColorAndSize.dart';
import 'package:karobar/src/widgets/Constants.dart';
import 'package:karobar/src/pages/counter_with_fav_btn.dart';
import 'package:karobar/src/pages/cart_counter.dart';
import 'package:karobar/src/pages/add_to_cart.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  String rating, prodid, prodname, prodPrice, proddescription;
  ProductDetails(
      {this.product,
      this.prodPrice,
      this.proddescription,
      this.prodid,
      this.prodname,
      this.rating});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.prodid}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Banners(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                    //anyother icon
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                    //anyother icon
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  widget.product.title,
                  style: style,
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  widget.product.price.toString(),
                  style: style,
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  widget.product.description,
                  style: style,
                )),
            Padding(
              padding: EdgeInsets.all(22),
              child: ColorAndSize(
                product: widget.product,
              ),
            ),
            CounterWithFavBtn(),
            SizedBox(height: 20 / 2),
            AddToCart(product: widget.product)
          ],
        ),
      ),
    );
  }
}
