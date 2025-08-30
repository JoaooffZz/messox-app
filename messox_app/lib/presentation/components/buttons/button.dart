import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  const ButtonCustom({
    super.key,
    required this.shadow,
    required this.text,
    required this.onTap,
    required this.ignoring
  });

  final Color shadow;
  final String text;
  final VoidCallback onTap;
  final bool ignoring;

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final Color background = widget.ignoring
      ?  Color(0xff00F977).withOpacity(0.7)
      :  Color(0xff00F977);

    final Color shadow = widget.ignoring
      ?  widget.shadow.withOpacity(0.2)
      :  widget.shadow;

    final Color colorText = widget.ignoring
      ? Color(0xff3C3C3D).withOpacity(0.5)
      : Color(0xff3C3C3D);

    return GestureDetector(
      onTapDown: (_) {
        setState(() => _pressed = true);
      },
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () {
        setState(() => _pressed = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: background,
          boxShadow: _pressed
              ? [] // sem sombra quando pressionado
              : [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 4,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.2),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: DefaultTextStyle(
              key: ValueKey(widget.text),
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RadioCanada',
                  fontWeight: FontWeight.w600,
                  color: colorText
                ),
              child: Text(
                widget.text,
              )
            ),
          ),
        ),
      ),
    );
  }
}
