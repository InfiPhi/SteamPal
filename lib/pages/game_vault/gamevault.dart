import 'package:flutter/material.dart';
import 'package:steam_pal/pages/game_vault/gamevault_game_info.dart';
import 'package:steam_pal/widgets/buttons/button_icon_circular.dart';

import '../../domain/services/steam_api.dart';
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
  List<String> _games = [];

  // List of games that appear in search query
  List<String> _filteredList = [];

  // Determines if UI is loading or not
  bool isLoading = false;

  String dropdownValue = "All";

  void loadGames() {
    setState(() {
      isLoading = true;
    });

    // TO-DO: GameVault games from server

    // Steam Games
    SteamAPI.getOwnedGames('76561198104497578').then((response) {
      if (response.response.games.isNotEmpty) {
        _games = response.response.games.map((g) => g.name).toList();
        setState(() {
          _filteredList = _games;
        });
      }
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  void searchGames(String query) {
    setState(() {
      if (dropdownValue == "Steam") {
        _filteredList = [];
      } else {
        _filteredList = _games
            .where((title) => title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadGames();
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
                        return GVGameInfoPage(gameTitle: gameTitle);
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
                  onPressed: () {},
                ),
              )),
        ],
      ),
    );
  }
}
