import 'package:flutter/material.dart';
import 'package:steam_pal/domain/services/igdb_api.dart';

import 'game.dart';

class GameList extends StatefulWidget {
  const GameList({Key? key, required this.games, this.onPressed})
      : super(key: key);

  final List<String> games;
  final Function? onPressed;

  @override
  State<GameList> createState() => _GameList();
}

class _GameList extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GameInfo>>(
        future: IGDBAPI.getGameCovers(widget.games),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("ERROR");
          }
          else if (snapshot.hasData) {
            return snapshot.data!.isEmpty
                ? Center(
                    child: Text(
                    "No Games Found",
                    style: TextStyle(
                        fontSize: 24, color: Colors.white.withOpacity(0.25)),
                  ))
                : GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 3/4,
                    padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
                    children: snapshot.data!.map((game) {
                      return Game(gameCover: game, onPressed: widget.onPressed);
                    }).toList(),
                  );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
