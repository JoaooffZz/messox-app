import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Lottie extends StatefulWidget {
  const Lottie({
    super.key,
    required this.height,
    required this.width,
    required this.lottie,
    this.controller,
    this.animate,
    this.repeat,
    this.reverse
  });

  final double height;
  final double width;
  final String lottie;
  final Animation<double>? controller;
  final bool? animate;
  final bool? reverse;
  final bool? repeat;

  @override
  State<Lottie> createState() => _Lottie();
}
class _Lottie extends State<Lottie>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: LottieBuilder.asset(
        widget.lottie,
        controller: widget.controller,
        animate: widget.animate,
        reverse: widget.reverse,
        repeat: widget.repeat,
      ),
    );
  }
}