import 'package:flutter/material.dart';



class RecentGames extends StatelessWidget {
  const RecentGames(this.recentGameList);

  final List<String> recentGameList;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            //acontainer contains row to show the circle and the title for recent games
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.pink,
                    size: 15.0,
                  ),
                  Text("  Most Played Games",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
              margin: EdgeInsets.fromLTRB(100, 30, 0, 0),
            ),

            //a scrobale horizental view to show recent games
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var i in recentGameList)
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/ror2_600x900.jpg',
                              width: 150, height: 200, fit: BoxFit.fill),
                        ),
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      ),
                  ],
                )),
          ],
        ));
  }
}