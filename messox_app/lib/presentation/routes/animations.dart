
import 'package:flutter/material.dart';

Route goRouteFadeEase(Widget goPage) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => goPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade + Zoom
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.25, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.ease),
          ),
          child: child,
        ),
      );
    },
  );
}

Route goRouteSlideFromRight(Widget goPage) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => goPage,
    transitionsBuilder: (_, animation, __, child) {
      const begin = Offset(1, 0); // Começa da direita
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 650),
  );
}