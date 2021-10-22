import 'dart:async';

import 'package:flutter/material.dart';

/// splash screen for the project
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// waits for certain duration and navigates to home screen.
  void _splashdelay() {
    Timer(
      //splash screen timer
      const Duration(seconds: 3),
      () {
        //loads home screen and splash screen do not appear 
        Navigator.pushReplacementNamed(context, "/home");
      },
    );
  }

  @override
  void initState() {
    _splashdelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink.shade600,
              Colors.pinkAccent.shade400,
            ],
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
