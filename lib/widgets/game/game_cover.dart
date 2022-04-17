import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GameCover extends StatefulWidget {
  const GameCover({Key? key, this.url, this.width = 200}) : super(key: key);

  final String? url;
  final double width;

  @override
  State<GameCover> createState() => _GameCover();
}

class _GameCover extends State<GameCover> {
  @override
  Widget build(BuildContext context) {
    return widget.url != null
        ? CachedNetworkImage(
            imageUrl: widget.url!,
            imageBuilder: (context, imageProvider) => Container(
              width: widget.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(4, 4))
                  ],
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.fill)),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
          )
        : const Icon(
            Icons.error,
            color: Colors.red,
            size: 64,
          );
  }
}
