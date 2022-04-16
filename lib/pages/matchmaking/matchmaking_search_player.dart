import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/game/player_count.dart';
import 'package:steam_pal/widgets/game/searching_popup.dart';
import 'package:steam_pal/widgets/navigation/top_bar.dart';

import '../../widgets/buttons/button_icon_circular.dart';

class MMSearchPlayerPage extends StatefulWidget {
  const MMSearchPlayerPage({
    Key? key,
    this.gameTitle = "Unknown",
    this.playerCount = 0,
  }) : super(key: key);

  final String gameTitle;
  final int playerCount;

  @override
  State<MMSearchPlayerPage> createState() => _MMSearchPlayerPage();
}

class _MMSearchPlayerPage extends State<MMSearchPlayerPage> {
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    // TO-DO: Get steam player count
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
                  LivePlayerCount(playerCount: widget.playerCount),
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
