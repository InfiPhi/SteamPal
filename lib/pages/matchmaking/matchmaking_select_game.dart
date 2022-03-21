import 'package:flutter/material.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_widget_holder.dart';
import 'package:steam_pal/widgets/buttons/button_round_gradient.dart';
import 'package:steam_pal/widgets/game/game_list.dart';

import '../../widgets/game/game.dart';
import '../../widgets/text/text_gradient.dart';
import '../welcome/login.dart';

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
          const Padding(
            padding: EdgeInsets.only(top: 64, bottom: 16),
            child: GradientText(
              "Select a game",
              gradient: LinearGradient(colors: [Color(0xff37C4B7), Color(0xffB9C44E),]),
              style: TextStyle(fontSize: 24,),
            ),
          ),
          GameList(selectGame),
        ],
      ),
    );
  }
}