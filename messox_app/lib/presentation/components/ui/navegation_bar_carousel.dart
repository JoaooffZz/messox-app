import 'package:flutter/material.dart';

class NavegationBarCarousel extends StatefulWidget {
  NavegationBarCarousel({
    super.key,
    required this.height,
    required this.width,
    required this.toggles,
    required this.background,
    required this.colorCarousel,
    this.borderRadiusCarousel = null,
    this.borderRadius = null,
    required this.onToggle,
    this.padding = 4.0,
    this.duration = const Duration(milliseconds: 300),
  });

  final double width;
  final double height;
  final List<Widget> toggles;
  final Color background; // background geral
  final Color colorCarousel; // cor do toggle selecionado
  final BorderRadius? borderRadiusCarousel; // borda do toggle animado
  final BorderRadius? borderRadius; // borda do container geral
  final double padding;
  final Duration? duration;
  final void Function(int index) onToggle;

  @override
  State<NavegationBarCarousel> createState() => _NavegationBarCarouselState();
}

class _NavegationBarCarouselState extends State<NavegationBarCarousel> {
  int _selectedIndex = 0;
  late final double _toggleWidth;

  @override
  void initState() {
    super.initState();
    // calcula largura de cada toggle considerando padding
    _toggleWidth = (widget.width - widget.padding * 2) / widget.toggles.length;
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onToggle(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
        color: widget.background,
        borderRadius: widget.borderRadius,
      ),
      child: Stack(
        children: [
          // Background animado do toggle selecionado
          AnimatedAlign(
            duration: widget.duration ?? const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment(
              -1.0 + (_selectedIndex / (widget.toggles.length - 1)) * 2.0,
              0,
            ), // mapeia índice para Alignment (-1 a 1)
            child: Container(
              width: _toggleWidth,
              height: double.infinity,
              decoration: BoxDecoration(
                color: widget.colorCarousel,
                borderRadius: widget.borderRadiusCarousel,
              ),
            ),
          ),

          // Row com todos os toggles
          Row(
            children: List.generate(widget.toggles.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => _onTap(index),
                  child: Center(
                    child: widget.toggles[index],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
