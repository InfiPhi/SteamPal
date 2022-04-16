import 'package:flutter/material.dart';

import '../../domain/models/json/steam/owned_games.dart';
import '../../domain/services/steam_api.dart';
import '../../widgets/game/game_list.dart';
import '../../widgets/navigation/nested_navigation.dart';
import '../../widgets/navigation/search_bar.dart';
import 'matchmaking_search_player.dart';

class MatchmakingPage extends StatefulWidget {
  const MatchmakingPage({Key? key, required this.navigatorKey})
      : super(key: key);

  final GlobalKey navigatorKey;

  @override
  State<MatchmakingPage> createState() => _MatchmakingPage();
}

class _MatchmakingPage extends State<MatchmakingPage> {
  List<String> _games = [];
  List<String> _filteredList = [];

  void updateGames(List<String> newGames) {
    setState(() {
      _filteredList = newGames;
    });
  }

  @override
  void initState() {
    super.initState();
    SteamAPI.getOwnedGames('76561198104497578').then((response) {
      if (response.response.games.isNotEmpty) {
        setState(() {
          _games = response.response.games.map((g) => g.name).toList();
          _filteredList = _games;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedNavigator(
        navigatorKey: widget.navigatorKey,
        child: Center(
          child: Column(
            children: [
              SearchBar(
                  title: 'Which Game?',
                  list: _games,
                  updateList: updateGames),
              Builder(
                builder: (context) {
                  return Expanded(
                      child: GameList(
                          games: _filteredList,
                          onPressed: (String game) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return MMSearchPlayerPage(gameTitle: game);
                            }));
                          }));
                },
              )
            ],
          ),
        ));
  }
}
