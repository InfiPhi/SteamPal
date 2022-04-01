import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/profileComponents/profileComponents.dart';

import '../../widgets/home/matchFinderSection.dart';
import '../../widgets/home/recentGames.dart';
import '../../widgets/navigation/nested_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.navigatorKey}) : super(key: key);

  final GlobalKey navigatorKey;

  @override
  Widget build(BuildContext context) {
    final recentGamesList = [
      'assets/images/profile.jpeg',
      'assets/images/profile.jpeg',
      'assets/images/profile.jpeg',
      'assets/images/profile.jpeg',
      'assets/images/profile.jpeg'
    ];
    return NestedNavigator(
        navigatorKey: navigatorKey,
        child: Column(
      children: [
        //a row to show the avatar and the welcoming message
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text(
                    "Welcome,",
                    style: TextStyle(fontSize: 40, color: Color(0xff29D8F7)),
                  ),
                  Text(
                    "Who would you like to play with today?",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              const Avatar('assets/images/profile.jpeg'),
            ],
          ),
        ),
        RecentGames(recentGamesList),
        const MatchFinder(30),
      ],
    ));
  }
}
