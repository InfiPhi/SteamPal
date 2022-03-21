import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/game/game_list.dart';

import '../../widgets/text/text_gradient.dart';

class GameVaultPage extends StatelessWidget {
  const GameVaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 64, bottom: 16),
            child: GradientText(
              "Game Vault",
              gradient: LinearGradient(colors: [Color(0xff37C4B7), Color(0xffB9C44E),]),
              style: TextStyle(fontSize: 24,),
            ),
          ),
          GameList(null),
        ],
      ),
    );
  }
}