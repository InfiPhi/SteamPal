import 'package:flutter/material.dart';

class ContainerFancy extends StatelessWidget {
  const ContainerFancy({Key? key, required this.child, this.width = 200})
      : super(key: key);

  final Widget child;
  final double width;
  
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff3673D7), Color(0xff59F29A)],
                tileMode: TileMode.mirror,
              )),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff682757), Color(0xff21222D)],
                    tileMode: TileMode.mirror,
                  )),
              child: child),
        );
  }
}
