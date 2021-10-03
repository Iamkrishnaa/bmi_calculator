import 'package:flutter/material.dart';

/// custom rounded button for increasing or decreasing value
class CustomRoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CustomRoundButton({
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      fillColor: const Color(0xff4c4f5e),
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 60,
        height: 60,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
