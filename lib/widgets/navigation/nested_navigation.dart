import 'package:flutter/material.dart';

class NestedNavigator extends StatefulWidget {
  const NestedNavigator({
    Key? key,
    required this.navigatorKey,
    required this.child,
  }) : super(key: key);

  final GlobalKey navigatorKey;
  final Widget child;

  @override
  State<NestedNavigator> createState() => _NestedNavigator();
}

class _NestedNavigator extends State<NestedNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return widget.child;
            });
      },
    );
  }
}