import 'package:flutter/material.dart';
import 'package:steam_pal/pages/welcome/splash.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MaterialApp(
    home: SafeArea(child: SplashPage())
    )
  );
}
