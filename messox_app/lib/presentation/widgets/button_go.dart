import 'package:flutter/material.dart';

class ButtonGo extends StatefulWidget {
  const ButtonGo({
    super.key,
    required this.height,
    required this.width,
    required this.colorBrightBackground,
    required this.text,
    required this.style,
    required this.onTap,
  });

  final double height;
  final double width;
  final Color colorBrightBackground;
  final String text;
  final TextStyle style;
  final VoidCallback onTap;

  @override
  State<ButtonGo> createState() => _ButtonGoState();
}

class _ButtonGoState extends State<ButtonGo> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.ease,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff00F977),
        boxShadow: [
          BoxShadow(
            color: widget.colorBrightBackground,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 4)
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.white.withOpacity(0.3), // efeito de clique
          onTap: widget.onTap,

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
              child: Text(
                widget.text,
                key: ValueKey(widget.text), // Necessário para o AnimatedSwitcher detectar mudanças
                style: widget.style,
              ),
            ),
          )
        ),
      ),
    );
  }
}
