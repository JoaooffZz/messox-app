import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonSvg extends StatelessWidget{
  ButtonSvg({
    required this.width,
    required this.height,
    required this.onTap,
    required this.svg,
    required this.color
  });
  
  final double height;
  final double width;
  final void Function() onTap;
  final String svg;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: SvgPicture.asset(
              svg,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
} 