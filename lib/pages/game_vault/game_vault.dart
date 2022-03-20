import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/game/game_list.dart';

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
            child: Text(
              "Game Vault",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          GameList(null),
        ],
      ),
    );
  }
}