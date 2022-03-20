import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/buttons/button_round_gradient.dart';

import 'matchmaking_widget_holder.dart';

class MMMatchFound extends StatelessWidget {
  final String matchName;
  final void Function(MMWidget)? setWidget;

  const MMMatchFound(this.setWidget, {this.matchName = "John Doe", Key? key}) : super(key: key);

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
              const Text(
                "YOU'VE MATCHED WITH",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                matchName,
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ButtonRoundGradient(
                text: "Accept",
                onPressed: () {},
                height: 75,
              ),
              ButtonRoundGradient(
                text: "Decline",
                onPressed: () {
                  setWidget?.call(MMWidget.search);
                },
                height: 75,
                colors: const [
                  Color(0xffFF5774),
                  Color(0xffFF8679),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}