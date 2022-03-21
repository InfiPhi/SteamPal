import 'package:flutter/material.dart';
import 'package:steam_pal/pages/welcome/signup.dart';
import 'package:steam_pal/widgets/buttons/button_round_gradient.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 2,
                  colors: [Color(0xff682757), Color(0xff21222D)]
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                    Icons.videogame_asset,
                    color: Colors.white,
                    size: 128,
                ),
                ButtonRoundGradient(
                  text: "Get Started",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const SignupPage();
                      }),
                    );
                  },
                ),
              ],
            ),
          )
        ),
      );
  }
}