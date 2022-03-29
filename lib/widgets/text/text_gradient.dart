import 'package:flutter/material.dart';

class TextGradient extends StatelessWidget {
  const TextGradient(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}


class CustomText extends StatelessWidget {
  const CustomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GradientText(
      "Home",
      gradient: LinearGradient(colors: [
        Color(0xff37C4B7),
        Color(0xffB9C44E),
      ]),
      style: TextStyle(
        fontSize: 36,
      ),
    );
  }
}