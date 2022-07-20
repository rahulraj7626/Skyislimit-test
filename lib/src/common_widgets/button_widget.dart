import 'package:flutter/material.dart';

/// Costum button widget
class ButtonWidget extends StatelessWidget {
  final String buttonName;

  final double? fontSize;
  final double? height;
  final void Function()? onpressed;

  const ButtonWidget({
    Key? key,
    required this.buttonName,
    this.fontSize,
    this.height,
    this.onpressed,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
          alignment: Alignment.center,
          height: height ?? 50,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(buttonName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: fontSize ?? 16,
              ))),
    );
  }
}
