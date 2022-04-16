import 'package:flutter/material.dart';

class PopupSearching extends StatelessWidget {
  const PopupSearching({
    Key? key,
  }) : super(key: key);

  final String _label = "Searching for player...";

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.65,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xff1F343E), Color(0xff262c39)],
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              // Shadow color
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 3,
                  offset: const Offset(0, 4)),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 20, maxHeight: 20),
                child: const CircularProgressIndicator(
                  color: Color(0xffE4DEFF),
                  strokeWidth: 3,
                ),
              ),
              Text(
                _label,
                style: const TextStyle(
                  color: Color(0xffE4DEFF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ));
  }
}
