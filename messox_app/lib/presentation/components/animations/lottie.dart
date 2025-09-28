import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieCustom extends StatelessWidget {
  final double height;
  final double width;
  final String asset;
  final Animation<double>? controller;
  final bool animate;
  final bool repeat;
  final bool reverse;

  const LottieCustom({
    super.key,
    required this.height,
    required this.width,
    required this.asset,
    this.controller,
    this.animate = true,
    this.repeat = true,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      asset,
      height: height,
      width: width,
      controller: controller,
      animate: animate,
      repeat: repeat,
      reverse: reverse,
    );
  }
}
