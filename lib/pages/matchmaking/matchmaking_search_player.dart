import 'package:flutter/material.dart';
import 'package:steam_pal/domain/services/steampal_api.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_player_found.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_search_filter.dart';
import 'package:steam_pal/widgets/dialog/dialog_dismiss.dart';
import 'package:steam_pal/widgets/game/player_count.dart';
import 'package:steam_pal/widgets/game/searching_popup.dart';
import 'package:steam_pal/widgets/navigation/top_bar.dart';

import '../../domain/services/steam_api.dart';
import '../../widgets/buttons/button_icon_circular.dart';
import '../../widgets/navigation/transparent_route.dart';

class MMSearchPlayerPage extends StatefulWidget {
  const MMSearchPlayerPage({Key? key, required this.gameTitle})
      : super(key: key);

  final String gameTitle;

  @override
  State<MMSearchPlayerPage> createState() => _MMSearchPlayerPage();
}

class _MMSearchPlayerPage extends State<MMSearchPlayerPage> {
  bool isSearching = false;
  int playerCount = -1;

  @override
  void initState() {
    super.initState();
    // Load player count
    SteamAPI.getPlayerCount(632360).then((response) {
      setState(() {
        playerCount = response.response.playerCount;
      });
    });

    // SteamPalAPI.getSteamGameID(widget.gameTitle).then((response){
    //   SteamAPI.getPlayerCount(response).then((response) {
    //     setState(() {
    //       playerCount = response.response.playerCount;
    //     });
    //   });
    // });
  }

  void _beginSearch() async {
    if (!isSearching) {
      setState(() {
        isSearching = true;
      });
      // TO-DO: Matchmaking API call
      await Future.delayed(const Duration(seconds: 1)).then((value) {
        int matchSteamID = 76561198104497578; // Returned from Matchmaking API
        // TO-DO: Replace with SteamPalAPI which will use this as part of its UserInfo call
        SteamAPI.getPlayerSummary(matchSteamID).then((response) {
          setState(() {
            isSearching = false;
          });
          if (response.response.players.isNotEmpty) {
            Navigator.of(context).push(MaterialTransparentRoute(
                builder: (context) =>
                    MMPlayerFoundPage(match: response.response.players.first)));
          } else {
            showDialog(
                context: context, builder: (context) => const DialogDismiss(
              title: "No Match Found",
              description: "Please try again, or try a different game.",
              symbol: Text(":(", style: TextStyle(fontSize: 32, color: Color(0xffE4DEFF))),
            ));
          }
        });
      });
    }
  }

  void _launchFilterPopup() {
    if (!isSearching) {
      showDialog(
          context: context, builder: (context) => const MMSearchFilterPage());
    }
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
                LivePlayerCount(playerCount: playerCount),
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
                      onPressed: _launchFilterPopup,
                    )
                  ],
                ),
                Visibility(
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    visible: isSearching,
                    child: const PopupSearching())
              ],
            ),
          ))
        ],
      ),
    );
  }
}
