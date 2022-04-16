import 'package:flutter/material.dart';

import '../../widgets/navigation/nested_navigation.dart';
import '../../widgets/navigation/search_bar.dart';

class GameVaultPage extends StatelessWidget {
  const GameVaultPage({Key? key, required this.navigatorKey}) : super(key: key);

  final GlobalKey navigatorKey;

  @override
  Widget build(BuildContext context) {
    return NestedNavigator(
        navigatorKey: navigatorKey,
        child: Center(
          child: Column(
            children: const [
              //SearchBar(title: 'Game Vault', list: []),
            ],
          ),
        ));
  }
}
