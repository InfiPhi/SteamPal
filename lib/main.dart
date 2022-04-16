import 'package:flutter/material.dart';
import 'package:steam_pal/pages/welcome/splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  Paint.enableDithering = true;
  runApp(const MaterialApp(home: SplashPage()));
}
