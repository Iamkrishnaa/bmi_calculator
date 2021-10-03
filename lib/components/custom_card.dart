import 'package:flutter/material.dart';

/// custom card widget
class CustomCard extends StatelessWidget {

  /// color of card
  final Color color;
  /// child of the card
  final Widget? child;

/// constructor
  const CustomCard({
    required this.color,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
