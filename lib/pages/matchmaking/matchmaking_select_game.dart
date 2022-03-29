import 'package:flutter/material.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_widget_holder.dart';
import 'package:steam_pal/widgets/buttons/button_icon_gradient.dart';
import 'package:steam_pal/widgets/game/game_list.dart';

import '../../widgets/text/text_gradient.dart';

class MMSelectGame extends StatelessWidget {
  MMSelectGame(this.setWidget, {Key? key}) : super(key: key);

  final void Function(MMWidget)? setWidget;
  final List<String> _tempGames = [
    "Risk of Rain 2",
    "Overwatch",
    "Elden Ring",
    "Garry's Mod",
    "Rounds",
    "Slay the Spire",
    "Blightbound",
    "ANVIL",
    "Inscryption",
    "Among Us",
  ];

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              // width = icon.width + (icon.padding * 2)
              SizedBox(width: 68),
              TextGradient(
                "Select a game",
                gradient: LinearGradient(colors: [
                  Color(0xff37C4B7),
                  Color(0xffB9C44E),
                ]),
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ButtonIconGradient(),
              )
            ],
          ),
          GameList(_tempGames, onPressed: selectGame),
        ],
      ),
    );
  }
}
