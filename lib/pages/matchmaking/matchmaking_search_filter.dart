import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/dialog/dialog_dismiss.dart';

class MMSearchFilterPage extends StatefulWidget {
  const MMSearchFilterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MMSearchFilterPage> createState() => _MMSearchFilterPage();
}

class _MMSearchFilterPage extends State<MMSearchFilterPage> {
  @override
  Widget build(BuildContext context) {
    return const DialogDismiss(
      title: "Filter Search",
      description:
          "This feature is still under development.\nPlease use the default search for now.",
      symbol: Icon(
        Icons.warning_rounded,
        color: Color(0xffeed202),
        size: 48,
      ),
    );
  }
}
