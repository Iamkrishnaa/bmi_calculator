import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget? child;

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
