import 'package:flutter/material.dart';

class DialogDismiss extends StatefulWidget {
  const DialogDismiss({
    Key? key,
    required this.title,
    required this.description,
    this.symbol,
  }) : super(key: key);

  final String title;
  final String description;
  final Widget? symbol;

  @override
  State<DialogDismiss> createState() => _DialogDismiss();
}

class _DialogDismiss extends State<DialogDismiss> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      contentPadding: EdgeInsets.zero,
      content: Container(
          padding: const EdgeInsets.all(8).copyWith(bottom: 0),
          decoration: BoxDecoration(
            gradient: const RadialGradient(
                center: Alignment.topRight,
                radius: 2,
                colors: [Color(0xff682757), Color(0xff21222D)]),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Wrap(
            children: [
              Column(
                children: [
                  const SizedBox(height: 8),
                  widget.symbol != null ? widget.symbol! : const SizedBox(),
                  const SizedBox(height: 8),
                  Text(widget.title, style: const TextStyle(fontSize: 16, color: const Color(0xffE4DEFF))),
                  const SizedBox(height: 8),
                  Text(widget.description, style: const TextStyle(fontSize: 12, color: Color(0xffE4DEFF))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text("Ok", style: TextStyle(color: Color(0xffE4DEFF)),),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
