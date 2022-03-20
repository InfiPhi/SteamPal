import 'package:flutter/material.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_filter_options.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_match_found.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_search.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_select_game.dart';

class MatchmakingPage extends StatefulWidget {
  const MatchmakingPage({Key? key}) : super(key: key);

  @override
  State<MatchmakingPage> createState() => _MatchmakingPage();
}

enum MMWidget {
  selectGame,
  search,
  filterOptions,
  matchFound,
}

class _MatchmakingPage extends State<MatchmakingPage> {
  _MatchmakingPage() {
    // Order must match enum above
    _widgetOptions = <Widget>[
      MMSelectGame(setWidget),
      MMSearch(setWidget),
      MMFilterOptions(setWidget),
      MMMatchFound(setWidget),
    ];
  }

  int _selectedIndex = MMWidget.selectGame.index;
  List<Widget> _widgetOptions = [];

  void setWidget(MMWidget widget) {
    setState(() {
      _selectedIndex = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 2,
                  colors: [Color(0xff682757), Color(0xff21222D)]
              )
          ),
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        );
  }
}