import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/text/text_gradient.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String _username = "";

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _username = (prefs.getString('username') ?? "");
    if (_username == "") {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/home'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.topRight,
                radius: 2,
                colors: [Color(0xff682757), Color(0xff21222D)])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.videogame_asset,
                color: Colors.white,
                size: 128,
              ),
              TextGradient(
                "Steam Pal",
                gradient: LinearGradient(colors: [
                  Color(0xff37C4B7),
                  Color(0xffB9C44E),
                ]),
                style: TextStyle(
                  fontSize: 40,
                ),
              )
              // ButtonRoundGradient(
              //     text: "Get Started",
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //         return LoginPage();
              //       }));
              //     })
            ],
          ),
        ));
  }
}
