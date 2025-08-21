import 'package:flutter/material.dart';

class TimeNotification extends StatefulWidget{
  const TimeNotification({
    super.key,
    required this.controller,
    required this.height,
    required this.width,
    required this.color,
    this.borderRadius,
    this.event,
    // required this.radius
  });

  final double height;
  final double width;
  final AnimationController controller;
  final Color color;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? event;
  // final double radius;


  @override
  State<TimeNotification> createState() => _TimeNotificationState();
}
class _TimeNotificationState extends State<TimeNotification> with TickerProviderStateMixin {

  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _widthAnimation = Tween<double>(begin: 0, end: widget.width)
      .animate(CurvedAnimation(parent: widget.controller, curve: Curves.ease));

    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.event != null) {
          widget.event!(); // chama o VoidCallback
        }
      }
    });

    widget.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child:ClipRRect(
        child: Align(
          alignment: Alignment.centerLeft,
          child: AnimatedBuilder(
            animation: _widthAnimation, 
            builder: (context, child) {
              return Container(
                width: _widthAnimation.value,
                // height: widget.height,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: widget.borderRadius
                ),
              );
            }
          ),
        ),
      )
    );
  }
}