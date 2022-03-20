import 'package:flutter/material.dart';

import 'game.dart';

class GameList extends StatelessWidget {
  const GameList(this.onPressed, {this.colCount = 2, Key? key}) : super(key: key);

  final int colCount;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisCount: colCount,
          crossAxisSpacing: 16,
          childAspectRatio: 0.56,
          children: [
            Game(onPressed),
            Game(onPressed),
            Game(onPressed),
            Game(onPressed),
            Game(onPressed),
            Game(onPressed),
          ],
        )
    );
  }
}