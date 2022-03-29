import 'package:flutter/material.dart';

class ButtonRoundGradient extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final double width;
  final double height;
  final List<Color> colors;

  const ButtonRoundGradient({
    // Optionals
    this.text = "Button",
    this.onPressed,
    this.width = 300,
    this.height = 50,
    this.colors = const [Color(0xffA6AC65), Color(0xff37C4B7)],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(64),
        ),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(64),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(width, height)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            // elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () => onPressed?.call(),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
