import 'package:flutter/material.dart';

class AnimatedWeightText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final Duration duration;

  const AnimatedWeightText({
    super.key,
    required this.text,
    required this.weight,
    this.duration = const Duration(milliseconds: 400),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: TextStyle(
        fontSize: 24,
        fontWeight: weight,
        fontFamily: 'RadioCanada',
        color: const Color(0xff3C3C3D),
      ),
      duration: duration,
      curve: Curves.easeInOut,
      child: Text(text),
    );
  }
}