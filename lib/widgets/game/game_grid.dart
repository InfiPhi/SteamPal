import 'package:flutter/material.dart';
import 'package:steam_pal/domain/services/igdb_api.dart';

import '../loading/loading_linear.dart';
import 'game_tile.dart';

class GameGrid extends StatefulWidget {
  const GameGrid({
    Key? key,
    required this.games,
    required this.isLoading,
    this.onPressed,
  }) : super(key: key);

  final List<String> games;
  final bool isLoading;
  final Function? onPressed;

  @override
  State<GameGrid> createState() => _GameGrid();
}

class _GameGrid extends State<GameGrid> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? const LoadingLinear(
            title: "Loading Your Games...",
            subtext: "This make take a moment the first time",
          )
        : FutureBuilder<List<GameInfo>>(
            future: IGDBAPI.getGameCovers(widget.games),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text(
                  "An Error Occurred",
                  style: TextStyle(color: Color(0xffE4DEFF), fontSize: 20),
                );
              } else if (snapshot.hasData) {
                return snapshot.data!.isEmpty
                    ? Center(
                        child: Text(
                        "No Games Found",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white.withOpacity(0.25),
                        ),
                      ))
                    : GridView.count(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 4,
                        padding:
                            const EdgeInsets.only(left: 4, right: 4, bottom: 4),
                        children: snapshot.data!.map((game) {
                          return GameTile(
                              gameCover: game, onPressed: widget.onPressed);
                        }).toList(),
                      );
              } else {
                return const LoadingLinear(
                  title: "Loading Game Covers...",
                  subtext: "This make take a moment the first time",
                );
              }
            });
  }
}
