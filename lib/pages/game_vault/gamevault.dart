import 'package:flutter/material.dart';
import 'package:steam_pal/domain/models/json/steampal/games.dart';
import 'package:steam_pal/pages/game_vault/gamevault_game_info.dart';
import 'package:steam_pal/widgets/buttons/button_icon_circular.dart';

import '../../domain/services/steam_api.dart';
import '../../domain/services/steampal_api.dart';
import '../../widgets/game/game_grid.dart';
import '../../widgets/navigation/nested_navigation.dart';
import '../../widgets/navigation/search_bar.dart';

class GameVaultPage extends StatefulWidget {
  const GameVaultPage({Key? key, required this.navigatorKey}) : super(key: key);

  final GlobalKey navigatorKey;

  @override
  State<GameVaultPage> createState() => _GameVaultPage();
}

class _GameVaultPage extends State<GameVaultPage> {
  // Users full list of games
  // Key = game name
  // Value = game details
  final Map<String, SteamPalGame> _games = {};

  // Users full list of game names (used for querying)
  final List<String> _gameNames = [];

  // List of games that appear in search query
  List<String> _filteredList = [];

  // Determines if UI is loading or not
  bool isLoading = false;

  // Callback function used by the search bar
  void searchGames(String query) {
    setState(() {
      _filteredList = _gameNames
          .where((title) => title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // TO-DO:
  void addGame() {

  }

  @override
  void initState() {
    super.initState();

    // Set UI to loading
    setState(() {
      isLoading = true;
    });
    // Get Users Games from Server
    SteamPalAPI.getAllUserGames().then((response) {
      // User has no games, add their steam games
      if (response.games.isEmpty) {
        SteamAPI.getOwnedGames('76561198104497578').then((response) {
          if (response.response.games.isNotEmpty) {
            for (var game in response.response.games) {
              SteamPalAPI.addGame(game.name);
            }
          }
        });
      }
      // User has games
      else {
        for (SteamPalGame game in response.games) {
          _games[game.name] = game;
          _gameNames.add(game.name);
        }
      }
    }).whenComplete(() {
      // Set UI to not-loading
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedNavigator(
      navigatorKey: widget.navigatorKey,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                  title: 'Game Vault',
                  searchCallback: searchGames,
                  filters: const ['All', 'Steam']),
              Expanded(child: Builder(builder: (context) {
                return GameGrid(
                    games: _filteredList,
                    isLoading: isLoading,
                    onPressed: (String gameTitle) {
                      // Hide Keyboard
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return GVGameInfoPage(game: _games[gameTitle]!);
                      }));
                    });
              }))
            ],
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ButtonCircularIcon(
                  iconSize: 32,
                  padding: 16,
                  onPressed: addGame,
                ),
              )),
        ],
      ),
    );
  }
}
