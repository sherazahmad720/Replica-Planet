import 'package:flutter/material.dart';
import 'package:karobar/main.dart';

Widget filledButton(
  String text,
  Color splashColor,
  Color highlightColor,
  Color fillColor,
  Color textColor,
) {
  return RaisedButton(
    highlightElevation: 0.0,
    splashColor: splashColor,
    highlightColor: highlightColor,
    elevation: 0.0,
    color: fillColor,
    shape:
        RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
    ),
    onPressed: () {
      return null;
    },
  );
}
