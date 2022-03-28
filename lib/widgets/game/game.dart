import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  final String title;
  final Function? onPressed;

  const Game(this.onPressed, {this.title = "[Placeholder]", Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        TextButton(
          onPressed: () => onPressed?.call(),
          child: Image.asset(
            "assets/images/ror2_600x900.jpg",
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
