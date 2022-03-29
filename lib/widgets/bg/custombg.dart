import 'dart:ui';

import 'package:flutter/material.dart';

class BioBg extends StatelessWidget {
  final double width;
  final double height;

  final double marginLeft;
  final double marginTop;

  final double marginRight;

  final double marginBottom;

  const BioBg(
    this.width,
    this.height,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff264C54), Color(0xff264C54)],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.topRight,
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(
            marginLeft, marginTop, marginRight, marginBottom));
  }
}

class CustomBgHalf extends StatelessWidget {
  final double width;
  final double height;

  const CustomBgHalf(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2C6DD4), Color(0xff46F395)],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Stack(
          children: [],
        ));
  }
}
