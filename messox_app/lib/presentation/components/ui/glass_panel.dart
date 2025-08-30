import 'dart:ui';
import 'package:flutter/material.dart';


class GlassPanel extends StatelessWidget {
  final double width;
  final double height;
  // final double borderRadius;
  final double blurSigma;
  final double opacity;
  final double borderOpacity;
  final Widget child;

  const GlassPanel({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    // this.borderRadius,
    this.blurSigma = 20,
    this.opacity = 0.12,
    this.borderOpacity = 0.4,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(opacity + 0.06),
                    Colors.white.withOpacity(opacity),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: Colors.white.withOpacity(borderOpacity),
                  width: 1.1,
                ),
                // borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}