import 'package:flutter/material.dart';

/// inactive container color
Color kInactiveColor = const Color(0xff111328);
/// active container color
Color kActiveColor = const Color(0xff1d1e33);

/// Title style constant. fontSize:19
TextStyle kTitleStyle = const TextStyle(
  fontSize: 19,
  color: Color(0xff8d8e98),
);

InputDecoration fieldDecorator = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
        vertical: 0.0, horizontal: 0.0),
    border: UnderlineInputBorder(
        borderSide: BorderSide(color: kButtonColor)
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kButtonColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kButtonColor),
    ),
    labelStyle: TextStyle()
);

/// Number style constant fontSize:50
TextStyle kNumberStyle = const TextStyle(
  color: Colors.white,
  fontSize: 35,
  fontWeight: FontWeight.w900,
);

/// Color of Button
Color kButtonColor = const Color(0xffeb1555);
/// Height of button
double kButtonHeight = 80;

/// Style of text inside button
TextStyle kButtonTextStyle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 30,
);
