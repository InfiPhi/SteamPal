import 'package:flutter/material.dart';
import 'package:steam_pal/pages/game_vault/game_vault.dart';
import 'package:steam_pal/pages/home/home.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_widget_holder.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_select_game.dart';
import 'package:steam_pal/widgets/navbar/bottom_bar.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'SteamPal';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: NavigationBottom(),
    );
  }
}

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MatchmakingPage(),
    GameVaultPage(),
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
