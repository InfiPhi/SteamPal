import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/navigation/top_bar.dart';
import '../../widgets/buttons/button_icon_circular.dart';

class MMSearchPlayerPage extends StatelessWidget {
  const MMSearchPlayerPage({Key? key, required this.gameTitle})
      : super(key: key);

  final String gameTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTopNavigationBar(title: gameTitle),
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonCircularIcon(
                  icon: Icons.person_search_rounded,
                  iconSize: 90,
                  padding: 16,
                  onPressed: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const Text("Match Found");
                    }))
                  },
                ),
                ButtonCircularIcon(
                  icon: Icons.filter_alt,
                  iconSize: 60,
                  colors: const [Color(0xff3673D6), Color(0xff29D8F7)],
                  onPressed: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const Text("Filter");
                    }))
                  },
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
