import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/game/player_count.dart';
import 'package:steam_pal/widgets/game/searching_popup.dart';
import 'package:steam_pal/widgets/navigation/top_bar.dart';

import '../../domain/models/game.dart';
import '../../domain/services/steam_api.dart';
import '../../widgets/buttons/button_icon_circular.dart';

class MMSearchPlayerPage extends StatefulWidget {
  const MMSearchPlayerPage({
    Key? key,
    required this.gameTitle
  }) : super(key: key);

  final String gameTitle;

  @override
  State<MMSearchPlayerPage> createState() => _MMSearchPlayerPage();
}

class _MMSearchPlayerPage extends State<MMSearchPlayerPage> {
  late Game gameDetails;
  bool _isSearching = false;
  int _playerCount = -1;

  @override
  void initState() {
    super.initState();

    // Load game details
    gameDetails = Game(widget.gameTitle);
    gameDetails.load().whenComplete(() {
      print(gameDetails.toString());
    });

    // Load player count
    SteamAPI.getPlayerCount(632360).then((response) {
      setState(() {
        _playerCount = response.response.playerCount;
      });
    });
  }

  void _beginSearch() async {
    setState(() {
      _isSearching = true;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTopNavigationBar(title: widget.gameTitle),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LivePlayerCount(playerCount: _playerCount),
                  Column(
                    children: [
                      ButtonCircularIcon(
                        icon: Icons.person_search_rounded,
                        iconSize: 80,
                        padding: 16,
                        onPressed: () => _beginSearch(),
                      ),
                      ButtonCircularIcon(
                        icon: Icons.filter_alt,
                        iconSize: 50,
                        colors: const [Color(0xff3673D6), Color(0xff29D8F7)],
                        onPressed: () => {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) {
                            return const Text("Filter");
                          }))
                        },
                      )
                    ],
                  ),
                  Visibility(
                      maintainState: true,
                      maintainAnimation: true,
                      maintainSize: true,
                      visible: _isSearching,
                      child: const PopupSearching())
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
