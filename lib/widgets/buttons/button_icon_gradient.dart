import 'package:flutter/material.dart';

class ButtonIconGradient extends StatelessWidget {
  const ButtonIconGradient(
      {this.icon = Icons.search_rounded,
      this.size = 36,
      this.onPressed,
      this.colors = const [Color(0xff37C4B7), Color(0xffB9C44E)]});

  final IconData icon;
  final Function? onPressed;
  final double size;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressed?.call(),
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
            minimumSize: Size(size, size)),
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: colors,
            tileMode: TileMode.mirror,
          ).createShader(bounds),
          child: Icon(icon, size: size, color: Colors.white),
        ));
  }
}
