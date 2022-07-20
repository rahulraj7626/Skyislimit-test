import 'package:flutter/material.dart';

///define custom text
Text textWidget(txt, double size, color, FontWeight weight) {
  return Text(txt.toString(),
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ));
}
