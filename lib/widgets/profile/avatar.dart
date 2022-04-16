import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.url,
    this.width = 125,
    this.height = 125,
  }) : super(key: key);

  final String url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: FadeInImage.assetNetwork(
          width: width,
          height: height,
          placeholder: 'assets/images/profile.jpeg',
          image: url),
    );
  }
}
