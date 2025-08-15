import 'dart:ui';

import 'package:flutter/material.dart';

class BottomNavHome extends StatefulWidget{
  final double height;
  final double width;
  final Widget child;

  const BottomNavHome({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  State<BottomNavHome> createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  @override
    @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // borderRadius: BorderRadius.circular(16), // bordas arredondadas
      child: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.transparent,
        child: Stack(
          children: [
            // Fundo desfocado
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Container(color: const Color(0xFF00BFFF).withOpacity(0.2)), // Blue 2
            // Layer semi-transparente com a cor 7F759B
            Container(
              color: const Color(0xFF7F759B).withOpacity(0.2),
            ),
            widget.child
            // Conteúdo por cima
            // child,
          ],
        ),
      ),
    );
  }
}
