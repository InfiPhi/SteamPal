import 'package:flutter/material.dart';
import '../../widgets/buttons/button_icon_circular.dart';
import 'matchmaking_widget_holder.dart';

class MMSearch extends StatelessWidget {
  final void Function(MMWidget)? setWidget;

  const MMSearch(this.setWidget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonCircularIcon(
            icon: Icons.person_search_rounded,
            iconSize: 90,
            padding: 16,
            onPressed: () => setWidget?.call(MMWidget.matchFound),
          ),
          ButtonCircularIcon(
            icon: Icons.filter_alt,
            iconSize: 60,
            colors: const [Color(0xff3673D6), Color(0xff29D8F7)],
            onPressed: () => setWidget?.call(MMWidget.filterOptions),
          )
        ],
      ),
    );
  }
}
