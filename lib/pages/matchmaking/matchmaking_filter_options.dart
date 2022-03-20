import 'package:flutter/material.dart';
import 'package:steam_pal/pages/matchmaking/matchmaking_widget_holder.dart';
import 'package:steam_pal/widgets/buttons/button_round_gradient.dart';

class MMFilterOptions extends StatelessWidget {
  final void Function(MMWidget)? setWidget;

  const MMFilterOptions(this.setWidget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Filter Search Page"),
          ButtonRoundGradient(
            text: "BACK",
            onPressed: () => setWidget?.call(MMWidget.search),
          )
        ],
      ),
    );
  }
}