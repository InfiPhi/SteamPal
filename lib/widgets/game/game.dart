import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:steam_pal/domain/services/igdb_api.dart';

class Game extends StatefulWidget {
  final GameInfo? gameCover;
  final Function? onPressed;

  const Game({Key? key, this.gameCover, this.onPressed}) : super(key: key);

  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return widget.gameCover != null
        ? TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(8)),
            onPressed: () => widget.onPressed?.call(widget.gameCover!.name),
            child: CachedNetworkImage(
              imageUrl: widget.gameCover!.url,
              imageBuilder: (context, imageProvider) => Container(
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(4, 4))
                    ],
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.fill)),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
            ))
        : const Icon(
            Icons.error,
            color: Colors.red,
            size: 64,
          );
  }
}
