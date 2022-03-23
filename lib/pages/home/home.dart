import 'package:flutter/material.dart';
import '../../widgets/text/text_gradient.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText();

  }
}



class CustomText extends StatelessWidget {
  const CustomText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const GradientText(
      "Home",
      gradient: LinearGradient(colors: [Color(0xff37C4B7), Color(0xffB9C44E),]),
      style: TextStyle(fontSize: 36,),
    );
  }
}








