import 'package:flutter/material.dart';

class ContainerCollapsable extends StatefulWidget {
  const ContainerCollapsable({
    Key? key
  }) : super(key: key);

  @override
  State<ContainerCollapsable> createState() => _ContainerCollapsable();
}

class _ContainerCollapsable extends State<ContainerCollapsable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Title"),
      children: [Text("Test")],
    );
  }
}
