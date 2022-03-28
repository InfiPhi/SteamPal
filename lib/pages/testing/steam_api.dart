import 'package:flutter/material.dart';
import 'package:steam_pal/domain/models/json/steam/owned_games.dart';
import 'package:steam_pal/widgets/text/text_gradient.dart';
import '../../domain/services/igdb_api.dart';
import '../../widgets/buttons/button_round_gradient.dart';
import '../../domain/services/steam_api.dart';

class SteamAPITestingPage extends StatefulWidget {
  const SteamAPITestingPage({Key? key}) : super(key: key);

  @override
  State<SteamAPITestingPage> createState() => _SteamAPITestingPage();
}

class _SteamAPITestingPage extends State<SteamAPITestingPage> {
  Future<SteamOwnedGamesResponse>? futureOwnedGames;
  final steamID = '76561198104497578'; // Sotoro
  final gameID = 730; // Counter Strike: Global Elite

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const TextGradient(
            "Steam API",
            gradient: LinearGradient(colors: [
              Color(0xff37C4B7),
              Color(0xffB9C44E),
            ]),
            style: TextStyle(
              fontSize: 36,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonRoundGradient(
                  text: "Global Achievements",
                  onPressed: () {
                    SteamAPI.getGlobalAchievements(gameID).then((response) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildAPIPopupDialog(
                              context,
                              response.achievementPercentages.achievements
                                  .map((a) => Text(a.name))
                                  .toList()));
                    });
                  },
                ),
                ButtonRoundGradient(
                  text: "Owned Games",
                  onPressed: () {
                    SteamAPI.getOwnedGames(steamID).then((response) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildAPIPopupDialog(
                              context,
                              response.response.games
                                  .map((g) => Text(g.name))
                                  .toList()));
                    });
                  },
                ),
                ButtonRoundGradient(
                  text: "IGDB TEST",
                  onPressed: () {
                    IGDBAPI.getGameID('Risk of Rain 2').then((response) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildAPIPopupDialog(
                              context,
                              response.potentialGames
                                  .map((g) => Text(g.name))
                                  .toList()));
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildAPIPopupDialog(BuildContext context, List<Widget> children) {
  return AlertDialog(
    title: const Text('API Response'),
    buttonPadding: EdgeInsets.zero,
    content: SizedBox(
      height: null,
      child: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
