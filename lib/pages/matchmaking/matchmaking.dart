import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/loading/loading_linear.dart';

import '../../domain/services/steam_api.dart';
import '../../widgets/game/game_grid.dart';
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
  bool isLoading = false;

  void updateGames(List<String> gameQuery) {
    setState(() {
      _filteredList = gameQuery;
    });
  }

  void searchGames(String query) {
    setState(() {
      _filteredList = _games
          .where((title) => title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() { isLoading = true; });
    SteamAPI.getOwnedGames('76561198104497578').then((response) {
      if (response.response.games.isNotEmpty) {
        _games = response.response.games.map((g) => g.name).toList();
        setState(() {
          _filteredList = _games;
        });
      }
    }).whenComplete(() {
      setState(() { isLoading = false; });
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
                  title: 'Which Game?', searchCallback: searchGames),
              Expanded(child:
                Builder(
                  builder: (context) {
                    return GameGrid(
                        games: _filteredList,
                        isLoading: isLoading,
                        onPressed: (String gameTitle) {
                          // Hide Keyboard
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return MMSearchPlayerPage(gameTitle: gameTitle);
                          }));
                        });
                  },
                )
              )
            ],
          ),
        ));
  }
}
