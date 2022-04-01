import 'package:flutter/material.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_search_player.dart';

import '../../widgets/game/game_list.dart';
import '../../widgets/navigation/nested_navigation.dart';
import '../../widgets/navigation/search_bar.dart';

class MatchmakingPage extends StatelessWidget {
  MatchmakingPage({Key? key, required this.navigatorKey}) : super(key: key);

  final GlobalKey navigatorKey;
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

  @override
  Widget build(BuildContext context) {
    return NestedNavigator(
        navigatorKey: navigatorKey,
        child: Center(
          child: Column(
            children: [
              const SearchBar(title: 'Select A Game'),
              Builder(
                builder: (context) {
                  return GameList(_tempGames, onPressed: (String game) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MMSearchPlayerPage(gameTitle: game);
                    }));
                  });
                },
              )
            ],
          ),
        ));
  }
}
