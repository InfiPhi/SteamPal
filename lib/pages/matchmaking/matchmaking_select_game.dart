import 'package:flutter/material.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_widget_holder.dart';
import 'package:steam_pal/widgets/game/game_list.dart';

import '../../widgets/text/text_gradient.dart';

class MMSelectGame extends StatelessWidget {
  const MMSelectGame(this.setWidget, {Key? key}) : super(key: key);

  final void Function(MMWidget)? setWidget;

  void selectGame() {
    setWidget?.call(MMWidget.search);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextGradient(
            "Select a game",
            gradient: LinearGradient(colors: [
              Color(0xff37C4B7),
              Color(0xffB9C44E),
            ]),
            style: TextStyle(
              fontSize: 36,
            ),
          ),
          GameList(selectGame),
        ],
      ),
    );
  }
}
