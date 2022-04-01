import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/buttons/button_icon_gradient.dart';
import 'package:steam_pal/widgets/text/text_gradient.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextGradient(
        title,
        gradient: const LinearGradient(colors: [
          Color(0xff37C4B7),
          Color(0xffB9C44E),
        ]),
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.normal
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: const [
        ButtonIconGradient()
      ],
    );
  }
}