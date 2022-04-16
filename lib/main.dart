import 'package:flutter/material.dart';
import 'package:steam_pal/pages/home/home.dart';
import 'package:steam_pal/pages/welcome/login.dart';
import 'package:steam_pal/pages/welcome/splash.dart';

Future main() async {
  //await dotenv.load(fileName: ".env");
  runApp(MyApp());
  Paint.enableDithering = true;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steam pal',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
