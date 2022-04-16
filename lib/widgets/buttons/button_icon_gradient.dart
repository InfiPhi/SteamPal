import 'package:flutter/material.dart';

class ButtonIconGradient extends StatefulWidget {
  const ButtonIconGradient({
    Key? key,
    this.icon = Icons.search_rounded,
    this.onPressed,
    this.size = 36,
    this.colors = const [Color(0xff37C4B7), Color(0xffB9C44E)],
    this.selectedColors = const [Color(0xff2C6DD4), Color(0xff46F395)]
  }) : super(key: key);

  final IconData icon;
  final Function? onPressed;
  final double size;
  final List<Color> colors;
  final List<Color> selectedColors;

  @override
  State<ButtonIconGradient> createState() => _ButtonIconGradient();
}

class _ButtonIconGradient extends State<ButtonIconGradient> {
  List<Color> _gradientColor = [];

  @override
  void initState() {
    super.initState();
    _gradientColor = widget.colors;
  }

  void pressed(highlighted) {
    setState(() {
      _gradientColor = highlighted ? widget.selectedColors : widget.colors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () => widget.onPressed?.call(),
        onHighlightChanged: (highlighted) => pressed(highlighted),
        enableFeedback: false,
        highlightColor: const Color(0x11000000),
        splashColor: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: _gradientColor,
            tileMode: TileMode.mirror,
          ).createShader(bounds),
          child: Icon(widget.icon, size: widget.size, color: Colors.white),
        ));
  }
}
