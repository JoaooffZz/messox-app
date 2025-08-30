
import 'package:flutter/material.dart';

class ContainerRotate extends StatefulWidget {
  const ContainerRotate({
    super.key,
    required this.controller,
    required this.degress,
    required this.content
  });

  final AnimationController controller;
  final double degress;
  final Widget content;

  @override
  State<ContainerRotate> createState() => _ContainerRotateState();
}

class _ContainerRotateState extends State<ContainerRotate> with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animation = Tween<double>(begin: 0, end: widget.degress)
        .animate(CurvedAnimation(parent: widget.controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation, 
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value,
            child: child,
          );
        },
        child: widget.content,
      ),
    );
  }
}
