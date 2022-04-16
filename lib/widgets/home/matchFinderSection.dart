import 'package:flutter/material.dart';
import 'package:steam_pal/pages/welcome/hub.dart';

import '../buttons/button_round_gradient.dart';

class MatchFinder extends StatelessWidget {
  final int appUsersNum;

  const MatchFinder(this.appUsersNum);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          //green background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff2C6DD4),
                  Color(0xff46F395),
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            height: 170,
            width: 280,
            margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
          ),

          //the section title and image needed to be add here as well
          Container(
            child: Row(
              children: [
                Container(
                  child: Column(children: [
                    Text(
                      "Let's find \nSteam Pal",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "${appUsersNum}M",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: 3,
                            width: 4,
                          ),
                          Icon(
                            Icons.account_circle_sharp,
                            color: Colors.yellow,
                            size: 15.0,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(0, 0, 90, 0),
                    ),

                    //button to navigate to match making
                    ButtonRoundGradient(
                      colors: [Color(0xffFF5774), Color(0xffFE8298)],
                      width: 10,
                      height: 5,
                      text: "Start Now",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HubPage()));
                      },
                    )
                  ]),
                  margin: EdgeInsets.fromLTRB(80, 16, 0, 0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
