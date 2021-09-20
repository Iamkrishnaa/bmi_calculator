import 'package:bmi/splashpage.dart';
import 'package:flutter/material.dart';

import 'screens/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => const SplashScreen(),
      "/home": (context) => const HomePage(),
    },
    theme: ThemeData().copyWith(
      primaryColor: const Color(0xff0A0E21),
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
      ),
      scaffoldBackgroundColor: const Color(0xff0A0E21),
      appBarTheme: const AppBarTheme().copyWith(
        color: const Color(0xff090C22),
      ),
    ),
  ));
}
