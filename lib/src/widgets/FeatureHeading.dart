import 'package:flutter/material.dart';

class FeatureHeading extends StatelessWidget {
  final Path;
  final String Heading;
  FeatureHeading({this.Heading, this.Path});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Heading,
            style: TextStyle(fontSize: 20, color: Color(0xff707070)),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Color(0xff707070)),
            onPressed: () {
              return null;
            },
          )
        ],
      ),
    );
  }
}
