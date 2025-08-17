
import 'package:flutter/material.dart';

Route goRouteFadeEase(Widget goPage) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (context, animation, secondaryAnimation) => goPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade + Zoom
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.9, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOut),
          ),
          child: child,
        ),
      );
    },
  );
}