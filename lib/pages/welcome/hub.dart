import 'package:flutter/material.dart';
import 'package:steam_pal/pages/game_vault/gamevault.dart';
import 'package:steam_pal/pages/home/home.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking.dart';

import '../../widgets/navigation/bottom_bar.dart';

class HubPage extends StatefulWidget {
  const HubPage({Key? key}) : super(key: key);

  @override
  State<HubPage> createState() => _HubPageState();
}

class _HubPageState extends State<HubPage> {
  int _pageIndex = 0;
  List<Widget> _widgetOptions = <Widget>[];
  final Map<int, GlobalKey> _navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
  };

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomePage(navigatorKey: _navigatorKeys[0]!),
      MatchmakingPage(navigatorKey: _navigatorKeys[1]!),
      GameVaultPage(navigatorKey: _navigatorKeys[2]!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 2,
                  colors: [Color(0xff682757), Color(0xff21222D)])),
          child: SafeArea(
            child: WillPopScope(
                onWillPop: () async {
                  return !await Navigator.maybePop(
                      _navigatorKeys[_pageIndex]!.currentState!.context);
                },
                child: _widgetOptions[_pageIndex]),
          ),
        ),
        bottomNavigationBar:
            CustomBottomNavigationBar(_pageIndex, _onItemTapped));
  }
}
