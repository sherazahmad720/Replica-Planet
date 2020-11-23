// import 'package:karobar/main.dart';
// import 'Homepage.dart';
import 'package:flutter/material.dart';
import 'package:karobar/src/widgets/slider.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  String rating, prodid, prodname, prodPrice, proddescription;
  ProductDetails(
      {this.prodPrice,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Banners(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.prodname),
                  Text(widget.proddescription),
                  Text(widget.prodPrice),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                  //anyother icon
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
