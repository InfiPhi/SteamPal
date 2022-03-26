import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/profileComponents/profileComponents.dart';
import '../../widgets/buttons/button_round_gradient.dart';
import '../../widgets/homeComponents/matchFinderSection.dart';
import '../../widgets/homeComponents/recentGames.dart';
import '../../widgets/text/text_gradient.dart';

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
    return SafeArea(
      child: Container(
          child: Column(
        children: [
          SizedBox(height: 30),
          //a row to show the avatar and the welcoming message
          Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      "Welcome,",
                      style: TextStyle(fontSize: 40, color: Color(0xff29D8F7)),
                    ),
                    Text(
                      "Who eould you like to play with today?",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
                margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              ),
              Avatar(50, 10, 0, 0, 'assets/images/profile.jpeg'),
            ],
          ),

          //section to show the gamer recent game that they played
          RecentGames(recentGamesList),
          SizedBox(height: 5),
          MatchFinder(30),
        ],
      )),
    );
  }
}







