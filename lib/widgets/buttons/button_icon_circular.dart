import 'package:flutter/material.dart';

class ButtonCircularIcon extends StatelessWidget {
  final IconData icon;
  final Function? onPressed;
  final double margin;
  final double padding;
  final double iconSize;
  final Color iconColor;
  final List<Color> colors;

  const ButtonCircularIcon(
    { // Optionals
      this.icon = Icons.add,
      this.onPressed,
      this.margin = 16.0,
      this.padding = 16.0,
      this.iconSize = 24,
      this.iconColor = Colors.white,
      this.colors = const [Color(0xffFF5774), Color(0xffFF8679),],
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(256),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () => onPressed?.call(),
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent), // <-- Button color
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) return Colors.black.withOpacity(0.15);
              return null; // <-- Splash color
            }),
          ),
        )
      ),
    );
  }
}