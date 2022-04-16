import 'dart:ui';

import 'package:flutter/material.dart';

import '../../widgets/bg/custombg.dart';
import '../../widgets/profileComponents/profileComponents.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genrelist = ["adventure", "Action"];
    final profileFavGames = [
      'assets/images/profile.jpeg',
      'assets/images/profile.jpeg',
      "assets/images/profile.jpeg"
    ];
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        center: Alignment.topRight,
                        radius: 2,
                        colors: [Color(0xff682757), Color(0xff21222D)])),
                child: Center(
                    child: Column(
                  children: [
                    Stack(
                      children: [
                        CustomBgHalf(480, 300),
                        BioBg(360, 300, 20, 70, 0, 20),
                        TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Profile()));
                            },
                            child: Avatar('assets/images/profile.jpeg')),
                        UserName(40, 100, 0, 0),
                        BioInfo("Avid gamer, fan of\n Studio Ghibli"),
                        GameGenre(genrelist),
                        FriendsOnline(4),
                      ],
                    ),
                    SizedBox(height: 10),
                    LatestInfo("John", 3, "Jocker"),
                    SizedBox(height: 30),
                    MyFavGame(profileFavGames),
                    SizedBox(height: 30),
                    MatchHisory("assets/images/ror2_600x900.jpg"),
                    SizedBox(height: 30),
                  ],
                )))));
  }
}
