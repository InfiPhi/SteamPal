import 'package:flutter/material.dart';
import 'package:steam_pal/pages/home/home.dart';
import 'package:steam_pal/pages/welcome/login.dart';
import 'package:steam_pal/pages/welcome/splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  Paint.enableDithering = true;
  runApp(MyApp());
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