
import 'package:flutter/material.dart';

Route goRouteFadeEase(Widget goPage) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 650),
    pageBuilder: (context, animation, secondaryAnimation) => goPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut, // curva de motion
      );
      return FadeTransition(
        opacity: curvedAnimation,
        child: child,
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