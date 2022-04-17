import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:steam_pal/domain/services/igdb_api.dart';
import 'package:steam_pal/widgets/game/game_cover.dart';

class GameTile extends StatefulWidget {
  final GameInfo? gameCover;
  final Function? onPressed;

  const GameTile({Key? key, this.gameCover, this.onPressed}) : super(key: key);

  @override
  State<GameTile> createState() => _GameTile();
}

class _GameTile extends State<GameTile> {
  @override
  Widget build(BuildContext context) {
    return widget.gameCover != null
        ? TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(8)),
            onPressed: () => widget.onPressed?.call(widget.gameCover!.name),
            child: GameCover(url: widget.gameCover!.url))
        : const Icon(
            Icons.error,
            color: Colors.red,
            size: 64,
          );
  }
}
