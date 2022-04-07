import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LivePlayerCount extends StatelessWidget {
  LivePlayerCount({
    Key? key,
    this.playerCount = 0
  }) : super(key: key);

  final int playerCount;
  final String _label = "Live Player Count";
  final _formatter = NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 200, minHeight: 85),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          // Shadow color
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, -4)
          ),
          // Background color
          const BoxShadow(
              color: Color(0xff1F343E),
              blurRadius: 2
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _label,
            style: const TextStyle(
              color: Color(0xffE4DEFF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _formatter.format(playerCount),
            style: const TextStyle(
              color: Color(0xffa3c79d),
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
