import 'dart:async';

import 'package:flutter/material.dart';

class FadeSlideText extends StatefulWidget {
  const FadeSlideText({
    super.key,
    required this.text,
    required this.controller,
    required this.textStyle,
    // this.duration = const Duration(milliseconds: 700),
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
  });

  final String text;
  final TextStyle textStyle;
  final AnimationController controller;
  // final Duration duration;
  final Duration delay;
  final Curve curve;

  @override
  State<FadeSlideText> createState() => _FadeSlideTextState();
}

class _FadeSlideTextState extends State<FadeSlideText> with SingleTickerProviderStateMixin {
  // late AnimationController widgetcontroller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  // late String _displayText;

  @override
  void initState() {
    super.initState();
    // _displayText = widget.text;

    // _controller = AnimationController(vsync: this, duration: widget.duration);

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

  /// Método público para trocar texto e reiniciar animação
  // void setTextAndRestart(String newText) {
  //   setState(() {
  //     _displayText = newText;
  //   });
  //   widget.controller.forward(from: 0.0);
  // }

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
