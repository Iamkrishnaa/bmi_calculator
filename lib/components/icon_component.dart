import 'package:bmi/const.dart';
import 'package:flutter/material.dart';

class IconComponent extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconComponent({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kTitleStyle,
        ),
      ],
    );
  }
}
