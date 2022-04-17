import 'package:flutter/material.dart';

class TextFieldGradient extends StatefulWidget {
  const TextFieldGradient({
    Key? key,
    required this.gradient,
    this.fontSize,
    this.hint,
    this.onChange,
    this.controller,
    this.autoFocus = false,
  }) : super(key: key);

  final Gradient gradient;
  final double? fontSize;
  final String? hint;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final bool autoFocus;

  @override
  State<TextFieldGradient> createState() => _TextFieldGradient();
}

class _TextFieldGradient extends State<TextFieldGradient> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          autofocus: widget.autoFocus,
          controller: widget.controller,
          cursorColor: const Color(0xff5ec497),
          textAlign: TextAlign.center,
          onChanged: (value) => widget.onChange?.call(value),
          style: TextStyle(
              fontSize: widget.fontSize ?? 24,
              foreground: Paint()
                ..shader = widget.gradient
                    .createShader(const Rect.fromLTWH(50, 50, 100, 100))),
          decoration: InputDecoration.collapsed(
              hintText: widget.hint ?? "Placeholder",
              hintStyle: TextStyle(
                foreground: Paint()..color = Colors.white.withOpacity(0.25),
              )),
        )
      ],
    );
  }
}
