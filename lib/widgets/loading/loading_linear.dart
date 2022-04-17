import 'package:flutter/material.dart';

class LoadingLinear extends StatelessWidget {
  const LoadingLinear({
    Key? key,
    this.title = "Loading...",
    this.subtext = "This may take a while",
  }) : super(key: key);

  final String title;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(color: Color(0xffE4DEFF), fontSize: 20),
        ),
        const SizedBox(height: 4),
        Text(subtext, style: const TextStyle(color: Color(0xffE4DEFF), fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
          child: LinearProgressIndicator(),
        ),
      ],
    );
  }
}
