import 'package:flutter/material.dart';
import 'package:steam_pal/pages/welcome/splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  Paint.enableDithering = true;
  runApp(const MaterialApp(home: SplashPage()));
}
