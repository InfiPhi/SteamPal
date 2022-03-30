import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/profileComponents/profileComponents.dart';

import '../../widgets/home/matchFinderSection.dart';
import '../../widgets/home/recentGames.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentGamesList = [
      'assets/images/profile.jpeg',
      'assets/images/profile.jpeg',
      'assets/images/profile.jpeg',
      'assets/images/profile.jpeg',
      'assets/images/profile.jpeg'
    ];
    return Column(
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
    );
  }
}
