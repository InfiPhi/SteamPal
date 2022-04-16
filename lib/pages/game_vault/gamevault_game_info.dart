import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/navigation/top_bar.dart';

import '../../domain/models/game.dart';

class GVGameInfoPage extends StatefulWidget {
  const GVGameInfoPage({Key? key, required this.gameTitle}) : super(key: key);

  final String gameTitle;

  @override
  State<GVGameInfoPage> createState() => _GVGameInfoPage();
}

class _GVGameInfoPage extends State<GVGameInfoPage> {
  late Game gameDetails;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    gameDetails = Game(widget.gameTitle);
    gameDetails.load().whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTopNavigationBar(title: widget.gameTitle),
          Expanded(
              child: Center(
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              /* --- GAME TITLE --- */
                              Text(gameDetails.name),
                              /* --- GENRES --- */
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: gameDetails.genres
                                    .map((g) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Text(g)))
                                    .toList(),
                              ),
                              /* --- PLATFORMS --- */
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: gameDetails.platforms
                                    .map((p) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Text(p)))
                                    .toList(),
                              ),
                              /* --- COMPANIES --- */
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: gameDetails.companies
                                    .map((c) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Text(c)))
                                    .toList(),
                              ),
                            ])))
        ],
      ),
    );
  }
}
