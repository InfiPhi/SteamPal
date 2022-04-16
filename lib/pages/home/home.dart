import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:steam_pal/widgets/profileComponents/profileComponents.dart';

import '../../widgets/homeComponents/matchFinderSection.dart';
import '../../widgets/homeComponents/recentGames.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentGamesList = [
      'assets/images/profile.jpeg',
      'assets/images/g1.jpeg',
      'assets/images/g1.jpeg',
      'assets/images/g1.jpeg',
      'assets/images/profile.jpeg'
    ];
    DateTime pre_backpress = DateTime.now();
    return SafeArea(
      //wrap the container in WillPopScope to implement 2 click to exit
      child: WillPopScope(
        onWillPop: () async {
          final timegap = DateTime.now().difference(pre_backpress);
          final cantExit = timegap >= Duration(seconds: 2);
          pre_backpress = DateTime.now();

          if (cantExit) {
            //show snackbar
            final snack = SnackBar(
              content: Text('Press Back button again to Exit'),
              duration: Duration(seconds: 2),
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
            return false; // false will do nothing when back press
          } else {
            SystemNavigator.pop();
            return true; // true will exit the app
          }
          return true;
        },
        child: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment.topRight,
                      radius: 2,
                      colors: [Color(0xff682757), Color(0xff21222D)])),
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
                              style: TextStyle(
                                  fontSize: 40, color: Color(0xff29D8F7)),
                            ),
                            Text(
                              "Who eould you like to play with today?",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
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
        ),
      ),
    );
  }
}
