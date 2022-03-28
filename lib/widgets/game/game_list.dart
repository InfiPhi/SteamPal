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
          padding: const EdgeInsets.all(8),
          crossAxisCount: colCount,
          childAspectRatio: 0.63,
          mainAxisSpacing: 8,
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