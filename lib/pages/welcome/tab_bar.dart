import 'package:flutter/material.dart';

import '../../widgets/navbar/bottom_bar.dart';
import '../game_vault/game_vault.dart';
import '../home/home.dart';
import '../matchmaking/matchmaking_widget_holder.dart';
import '../profile/profile.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MatchmakingPage(),
    GameVaultPage(),
    Profile(),
  ];

  // Widget Selection
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
            _selectedIndex,
            _onItemTapped
        )
    );
  }
}