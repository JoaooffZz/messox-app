import 'dart:async';

import 'package:flutter/material.dart';

class FadeSlideText extends StatefulWidget {
  const FadeSlideText({
    super.key,
    required this.text,
    required this.controller,
    required this.textStyle,
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
  });

  final String text;
  final TextStyle textStyle;
  final AnimationController controller;
  final Duration delay;
  final Curve curve;

  @override
  State<FadeSlideText> createState() => _FadeSlideTextState();
}

class _FadeSlideTextState extends State<FadeSlideText> with SingleTickerProviderStateMixin {
  late Animation<double> _opacity;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _opacity = CurvedAnimation(parent: widget.controller, curve: widget.curve)
        .drive(Tween(begin: 0.0, end: 1.0));

    _slide = CurvedAnimation(parent: widget.controller, curve: widget.curve)
        .drive(Tween<Offset>(begin: const Offset(0, -0.35), end: Offset.zero));

    if (widget.delay > Duration.zero) {
      Timer(widget.delay, widget.controller.forward);
    } else {
      widget.controller.forward();
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: DefaultTextStyle(
          style: widget.textStyle, 
          child: Text(widget.text)
        ),
      ),
    );
  }
}
