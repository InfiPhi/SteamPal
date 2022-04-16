import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:steam_pal/widgets/buttons/button_round_gradient.dart';
import 'package:steam_pal/widgets/containers/container_fancy.dart';
import 'package:steam_pal/widgets/game/game_tile.dart';
import 'package:steam_pal/widgets/profile/avatar.dart';
import 'package:steam_pal/widgets/text/text_gradient.dart';

import '../../domain/models/json/steam/player_summary.dart';
import '../../domain/services/steam_api.dart';
import '../../widgets/game/game_cover.dart';

class MMPlayerFoundPage extends StatefulWidget {
  const MMPlayerFoundPage({
    Key? key,
    required this.match,
  }) : super(key: key);

  final SteamPlayerSummary match;

  @override
  State<MMPlayerFoundPage> createState() => _MMPlayerFoundPage();
}

class _MMPlayerFoundPage extends State<MMPlayerFoundPage> {
  // TO-DO: Replace with proper API
  List<String> favGames = [
    "https://images.igdb.com/igdb/image/upload/t_cover_big_2x/co45rg.jpg",
    "https://images.igdb.com/igdb/image/upload/t_cover_big_2x/co45rg.jpg",
    "https://images.igdb.com/igdb/image/upload/t_cover_big_2x/co45rg.jpg"
  ];
  String description = "Avid gamer, fan of Studio Ghibli";

  void matchAccepted() {
    // TO-DO:
    // Option 1: Auto-add friend
    // Option 2: Show friend code
    // Option 3: Link their steam profile
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xAA210f1e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  gradient: RadialGradient(
                      center: Alignment.topRight,
                      radius: 2,
                      colors: [Color(0xff682757), Color(0xff21222D)])),
              child: Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Avatar(url: widget.match.avatarFull),
                    const SizedBox(width: 16),
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.match.name,
                            style: const TextStyle(
                                fontSize: 32, color: Color(0xffE4DEFF))),
                        const SizedBox(height: 8),
                        Text(description,
                            style: const TextStyle(color: Color(0xffE4DEFF))),
                        const SizedBox(height: 8),
                      ],
                    ))
                  ]),
                  const SizedBox(height: 16),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text("Top 3 Favorite Games",
                            style: TextStyle(color: Color(0xffE4DEFF))),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: favGames
                                  .map((value) => GameCover(
                                        url: value,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                      ))
                                  .toList()))
                    ],
                  ))
                ],
              ),
            )),
            Expanded(
                child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text("YOU'VE MATCHED WITH",
                    style: TextStyle(fontSize: 20, color: Color(0xffE4DEFF))),
                const SizedBox(
                  height: 16,
                ),
                ContainerFancy(
                    child: TextGradient(widget.match.name,
                        style: const TextStyle(fontSize: 36),
                        gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [Color(0xff3673D7), Color(0xff59F29A)],
                          tileMode: TileMode.mirror,
                        ))),
                const SizedBox(
                  height: 8,
                ),
                ButtonRoundGradient(
                  text: "Accept",
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(LineIcons.check, color: Colors.white, size: 26),
                  ),
                  onPressed: matchAccepted,
                ),
                ButtonRoundGradient(
                  text: "Declined",
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(LineIcons.times, color: Colors.white, size: 26),
                  ),
                  colors: const [Color(0xffFF5774), Color(0xffFF8679)],
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
