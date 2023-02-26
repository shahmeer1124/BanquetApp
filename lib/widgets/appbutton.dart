import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'apptext.dart';

class AppButton extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundcolor;
  double size;
  final Color bordercolor;
  bool? isicon;
  AppButton(
      {Key? key,
      this.text,
      this.isicon,
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundcolor,
      required this.bordercolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundcolor,
      ),
      child: isicon == false
          ? Center(
              child: AppText(
              text: text!,
              color: color,
            ))
          : Center(
              child: Icon(
              icon,
              color: color,
            )),
    );
  }
}
