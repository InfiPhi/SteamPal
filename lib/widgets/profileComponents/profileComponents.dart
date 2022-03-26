import 'dart:ui';

import 'package:flutter/material.dart';

import '../bg /custombg.dart';



class FriendsOnline extends StatelessWidget {
  const FriendsOnline(this.numFriendsOnline);
  final int numFriendsOnline;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        children: [
          Icon(
            Icons.circle,
            color: Colors.green,
            size: 20.0,

          ),
          Text(
            "    ${numFriendsOnline.toString()} Friends Online",
            style: TextStyle(
                fontSize:20,
                color: Colors.white
            ),)
        ],

      ),
      margin: EdgeInsets.fromLTRB(60, 330, 0, 0),
    );
  }
}

class Avatar extends StatelessWidget {
  final double marginLeft;
  final double marginTop ;
  final double marginRight ;
  final double marginBottom ;
  final String imageAssets;
  const Avatar(
      this.marginLeft ,
      this.marginTop ,
      this.marginRight,
      this.marginBottom ,
      this.imageAssets,
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 80.0,
        backgroundImage:AssetImage(imageAssets),
      ),
      margin: EdgeInsets.fromLTRB(marginLeft,marginTop,marginRight, marginBottom),

    ) ;
  }
}

class GameGenre extends StatelessWidget {
  const GameGenre(this.genreList);
  final  List<String> genreList ;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            for ( var i in genreList ) Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Text(
                i,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
            ),
            if(genreList.length <3 ) Container(
              child : FloatingActionButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                backgroundColor: Color(0xffFF5774),

                child: const Icon(Icons.add),

              ),
              margin: EdgeInsets.fromLTRB(80, 0, 0, 0),


            )
            else Container(
              child : FloatingActionButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                backgroundColor: Color(0xffFF5774),

                child: const Icon(Icons.edit),

              ),
              margin: EdgeInsets.fromLTRB(18, 0, 0, 0),


            )
          ],
        ),
        margin: EdgeInsets.fromLTRB(30,240,0,20)
    );
  }



}

class BioInfo extends StatelessWidget {
  //get the user bio from th db and render it here
  const BioInfo(this.userBio);
  final userBio;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Text(
        userBio,
        style: TextStyle(
            fontSize: 20,
            color: Colors.white
        ),
      ),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(40, 150, 0, 0),
    );
  }
}

class UserName extends StatelessWidget {
  //this class to display the uer name by giving the marging attributes
  //in this order: Left, Top, Right, Bottom
  final double marginLeft;
  final double marginTop ;
  final double marginRight ;
  final double marginBottom ;
  UserName(
      this.marginLeft ,
      this.marginTop ,
      this.marginRight,
      this.marginBottom ,
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Text(
        "Sotor",
        style:TextStyle(
          fontSize: 40,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1
            ..color = Colors.white, ),
      ),

      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(marginLeft,marginTop,marginRight, marginBottom),
    );
  }
}



class FinderMatchStatus extends StatelessWidget {
  const FinderMatchStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LatestInfo extends StatelessWidget {

  const LatestInfo(this.lastPlayWith, this.lastTimePlaying, this.lastPlayedGame);
  final String  lastPlayWith ;
  final int lastTimePlaying;
  final String lastPlayedGame;

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Row(
          children: [
            Stack(
              children: [
                BioBg(80, 80 , 10,10,0,0),
                Container(
                  child:
                  Icon(Icons.videogame_asset,color: Color(0xffFF5774),size: 60,),
                  margin: EdgeInsets.fromLTRB(21, 22, 0, 0),
                )
              ],
            ),
            Column(
              children: [
                Text("Last Played", style: TextStyle(
                    fontSize: 10,color: Colors.white
                ),),
                SizedBox(height: 0),
                Text(" ${lastPlayedGame}" ,style: TextStyle(
                    fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold
                ), ),
                SizedBox(height: 5),
                Text("${lastTimePlaying} hours ago" , style:TextStyle(
                    fontSize: 10,color: Colors.white
                ))


              ],

            ),

            Stack(
              children: [
                BioBg(80, 80 , 15,10,0,0),
                Container(
                  child:
                  Icon(Icons.account_box_rounded,color: Color(0xffFF5774),size: 60,),
                  margin: EdgeInsets.fromLTRB(25, 22, 0, 0),
                )
              ],
            ),
            Column(

              children: [
                Text("With", style: TextStyle(
                    fontSize: 10,color: Colors.white
                ),),
                SizedBox(height: 5),
                Text("  ${lastPlayWith}" ,style: TextStyle(
                    fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold
                ), ),
                SizedBox(height: 5),
              ],

            )

          ],
        )
    );
  }
}

class MyFavGame extends StatelessWidget {
  final List<String> favGameList ;
  const MyFavGame(this.favGameList);
  @override
  Widget build(BuildContext context) {
    return Container(
        child:Stack(
          children: [
            BioBg(400, 200, 0, 0, 0, 0),
            Column(
              children: [
                //the title and the edit floating button
                Row(
                  children: [
                    Text("  My Favourite Games",style: TextStyle(
                        fontSize: 26,color: Colors.white
                    ),),
                    //floating
                    Container(
                      width: 40,
                      child : FloatingActionButton(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        backgroundColor: Color(0xffFF5774),

                        child: const Icon(Icons.edit, size: 25,),

                      ),
                      margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                    )
                  ],
                ),

                SizedBox(height: 5),

                //iterate through the list of games ad create a row with these elements
                Row(
                  children: [
                    for ( var i in favGameList ) Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: TextButton(
                        onPressed: () =>{},
                        child: Image.asset(
                          i,
                          height: 110,width: 80,
                        ),
                      ),
                    ),

                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [ Color(0xffFF5774),Color(0xffFF5774)],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.topRight,
                          width: 90,
                          height: 120,margin: EdgeInsets.fromLTRB(8, 0, 0, 0),),
                        Container(child:Text("View \n  All", style: TextStyle(
                            fontSize: 30,color: Colors.white
                        ),),margin: EdgeInsets.fromLTRB(20, 30, 0, 0)
                          ,)
                      ],
                    )


                  ],
                )
                //iterate through my game list
              ],
            )
          ],
        )
    );
  }
}


class MatchHisory extends StatelessWidget {
  final String lastGameIcon ;
  const MatchHisory(this.lastGameIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Stack(
          children: [
            //background
            BioBg(340, 150, 30, 0, 0, 0),
            Row(
              children: [
                //title
                Container(
                  child:
                  Text("Finder \nMatch \nStatus", style: TextStyle(
                      fontSize: 26, color: Colors.white
                  ),),
                  margin: EdgeInsets.fromLTRB(50, 30, 0, 0),

                ),

                //last game request match for
                Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.fromLTRB(10, 35, 0, 0),
                    child:
                    Image.asset( lastGameIcon,)
                ),

                //contains details about the last match request
                Column(
                  children: [

                    Container(
                      margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child:TextButton(
                        onPressed: () =>{},
                        child: Text(
                          "View All",style: TextStyle(
                            fontSize: 10,color:Colors.white
                        ),
                        ),
                      ),
                    ),

                    Text("Looking for a gamer" , style:TextStyle(
                        fontSize: 15, color: Colors.white
                    )),
                    Divider(
                      color: Colors.red,
                      thickness: 8,
                    ),


                    //first filter for the match
                    Row(
                      children: [
                        Icon(Icons.pin_drop, color: Color(0xffFF5774),size :20),
                        Text("Canada",style:TextStyle(
                            color: Colors.white
                        )) ,

                      ],
                    ),
                    SizedBox(height: 5),

                    //second filter for the match
                    Row(
                      children: [
                        Icon(Icons.language, color: Color(0xffFF5774),size :20),
                        Text("Italy or French",style:TextStyle(
                            color: Colors.white
                        )) ,

                      ],
                    ),










                  ],
                )



              ],
            )




            //


          ],

        )
    );
  }
}









