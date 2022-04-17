import 'package:flutter/material.dart';
import 'package:steam_pal/domain/models/json/steampal/games.dart';
import 'package:steam_pal/widgets/navigation/top_bar.dart';

class GVGameInfoPage extends StatefulWidget {
  const GVGameInfoPage({Key? key, required this.game}) : super(key: key);

  final SteamPalGame game;

  @override
  State<GVGameInfoPage> createState() => _GVGameInfoPage();
}

class _GVGameInfoPage extends State<GVGameInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTopNavigationBar(title: widget.game.name),
          const Expanded(child: Center(child: Text("Game Info")))
        ],
      ),
    );
  }
}
