import 'package:flutter/material.dart';

class MoveFadeIn extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const MoveFadeIn({super.key, required this.child, this.delay = const Duration(seconds: 1)});

  @override
  State<MoveFadeIn> createState() => _MoveFadeInState();
}

class _MoveFadeInState extends State<MoveFadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    Future.delayed(widget.delay, () {
      if (mounted) {
        // print('ANIMAÇÃO COMEÇOU');
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 25 * (1 - _animation.value)), // move de 0 a -25
          child: Opacity(
            opacity: _animation.value, // fade in
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
