import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  final String? url;
  final Function? onPressed;

  const Game({Key? key, this.url, this.onPressed}) : super(key: key);

  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return widget.url != null
        ? TextButton(
            onPressed: () => widget.onPressed?.call(),
            child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 4,
                      offset: const Offset(4, 4))
                ]),
                child: CachedNetworkImage(
                  imageUrl: widget.url!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                )),
          )
        : const Icon(
            Icons.error,
            color: Colors.red,
            size: 64,
          );
  }
}
