import 'package:flutter/material.dart';

class TransparentLoopAnimation extends StatefulWidget {

  const TransparentLoopAnimation({
    super.key,
    required this.child,
    required this.height,
    required this.width,
    required this.duration,
    required this.controller
  });

  final Widget child;
  final double height;
  final double width;
  final Duration duration;
  final AnimationController controller;

  @override
  State<TransparentLoopAnimation> createState() => _TransparentLoopAnimationState();
}

class _TransparentLoopAnimationState extends State<TransparentLoopAnimation>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // _controller = AnimationController(
    //   vsync: this,
    //   duration: widget.duration,
    // );

    _animation = CurvedAnimation(
      parent: widget.controller,
      curve: Curves.ease,
    );

    // widget.controller.repeat(reverse: true); // Faz o loop clareando e escurecendo
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,   
      child:FadeTransition(
        opacity: _animation,
        child: Center(
          child: widget.child,
        ),
      )
    );
  }
}