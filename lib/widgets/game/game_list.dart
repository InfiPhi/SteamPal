import 'package:flutter/material.dart';
import 'package:steam_pal/domain/services/igdb_api.dart';

import 'game.dart';

class GameList extends StatefulWidget {
  final List<String> games;
  final Function? onPressed;

  const GameList(this.games, {Key? key, this.onPressed}) : super(key: key);

  @override
  State<GameList> createState() => _GameList();
}

class _GameList extends State<GameList> {
  var urlList = [];

  @override
  void initState() {
    super.initState();
    IGDBAPI.getGameCovers(widget.games).then((response) {
      setState(() {
        urlList = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
          padding: const EdgeInsets.all(8),
          crossAxisCount: 2,
          childAspectRatio: 0.76,
          children: [
              for (var url in urlList)
                Game(url: url, onPressed: widget.onPressed)
          ]
        )
    );
  }
}