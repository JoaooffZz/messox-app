import 'package:flutter/material.dart';

class DoubleToggleCarousel extends StatefulWidget {
  const DoubleToggleCarousel({
    super.key,
    required this.width,
    required this.height,
    required this.padding,
    required this.borderRadiusToggle,
    required this.radiusCarousel,
    required this.onEventLeft,
    required this.onEventRight,
    required this.colorCarousel,
    required this.color,
    required this.toggleLeft,
    required this.toggleRight,
    this.duration
  });

  final double width;
  final double height;
  final double padding;
  final BorderRadiusGeometry borderRadiusToggle;
  final double radiusCarousel;
  final int ?duration;
  final void Function() onEventLeft;
  final void Function() onEventRight;
  final Color colorCarousel;
  final Color color;
  final Widget toggleLeft;
  final Widget toggleRight;

  @override
  State<DoubleToggleCarousel> createState() => _DoubleToggleCarouselState();
}

class _DoubleToggleCarouselState extends State<DoubleToggleCarousel> {
  int _selectedIndex = 0;
  late final double _spacing;

  @override
  void initState() {
    super.initState();
    _spacing = widget.padding * 2;
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: widget.borderRadiusToggle,
      ),
      child: Stack(
        children: [
          // Background animation carousel
          AnimatedAlign(
            duration: Duration(milliseconds: widget.duration ?? 300),
            curve: Curves.easeInOut,
            alignment:
                _selectedIndex == 0 ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: (widget.width - _spacing) / 2,
              height: double.infinity,
              decoration: BoxDecoration(
                color: widget.colorCarousel,
                borderRadius: BorderRadius.circular(widget.radiusCarousel),
              ),
            ),
          ),

          // Toggles
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.onEventLeft();
                    _onTap(0);
                  },
                  child: Center(
                    child: widget.toggleLeft,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.onEventRight();
                    _onTap(1);
                  },
                  child: Center(
                    child: widget.toggleRight,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}