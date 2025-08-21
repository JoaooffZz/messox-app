import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopNotification extends StatefulWidget{
  const TopNotification({
    super.key,
    required this.preView,
    required this.content,
    required this.timeNotification,
    required this.backgroundTime,
    required this.background,
    required this.seconds,
  });

  final Widget preView;
  final Widget content;
  final int timeNotification;
  final Color background;
  final Color backgroundTime;
  final int seconds;

  static void show(BuildContext context) {
    // final overlay = Overlay.of(context);
    // final entry = OverlayEntry(
    //   builder: (context) => TopNotification(),
    // );
    // overlay.insert(entry);

    // Future.delayed(const Duration(seconds: 3), () {
    //   entry.remove();
    // });
  }

  @override
  State<TopNotification> createState() => _TopNotification();
}

class _TopNotification extends State<TopNotification> with TickerProviderStateMixin{
  late AnimationController _notification;
  late AnimationController _timeNotification;
  late Animation<Offset> _offsetAnimation;
  double _contentHeight = 0;
  // double _height = 0;

  @override
  void initState() {
    super.initState();
    _timeNotification = AnimationController(
      vsync: this, duration: Duration(seconds: widget.seconds)
    );
    _notification = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300)
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -2.0), end: Offset.zero
    ).animate(CurvedAnimation(parent: _notification, curve: Curves.easeOut));

    // _notification.forward();
  }
  @override
  Widget build(BuildContext context) {
    final widthMQ = MediaQuery.of(context).size.width;
    final heightMQ = MediaQuery.of(context).size.height;
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          height: heightMQ * 0.09,
          width: widthMQ * 0.8,
          decoration: BoxDecoration(
            color: widget.background,
            borderRadius: BorderRadius.circular(15)
          ),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              
              // preview
              Container(
                height: heightMQ * 0.03,
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 10),
                    widget.preView,
                    Spacer(),
                    // InkWell(
                    //   onTap: () => {},
                    //   splashFactory: NoSplash.splashFactory, // desabilita splash
                    //   highlightColor: Colors.transparent,     // remove highlight
                    //   // child: AnimatedContainer(
                    //   //   width: 30,
                    //   //   height: 30,
                    //   //   alignment: Alignment.center,
                    //   //   decoration: BoxDecoration(
                    //   //     color: Colors.blue,
                    //   //     borderRadius: BorderRadius.circular(12),
                    //   //   ),
                    //   //   child: SvgPicture.asset(
                    //   //     'assets/icon.svg', // caminho do seu arquivo SVG
                    //   //     width: 24,
                    //   //     height: 24,
                    //   //     // color: Colors.white, // opcional, para alterar cor do SVG
                    //   //   ),
                    //   // ),
                    // ),
                    const SizedBox(width: 10),
                    // InkWell(
                    //   onTap: () => {},
                    //   splashFactory: NoSplash.splashFactory, // desabilita splash
                    //   highlightColor: Colors.transparent,     // remove highlight
                    //   child: Container(
                    //     width: 30,
                    //     height: 30,
                    //     alignment: Alignment.center,
                    //     decoration: BoxDecoration(
                    //       color: Colors.blue,
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     child: SvgPicture.asset(
                    //       'assets/icon.svg', // caminho do seu arquivo SVG
                    //       width: 24,
                    //       height: 24,
                    //       // color: Colors.white, // opcional, para alterar cor do SVG
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(width: 10)
                  ],
                ),
              ),
              // content
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: double.infinity,
                height: _contentHeight,
                color: Colors.transparent,
                padding: EdgeInsets.only(
                  top: 10, bottom: 10, 
                  left: 25, right: 25
                ),
                child: widget.content,
              ),
              // time
              SizedBox(
                height: 30,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text(
                      'this message will close in 3 seconds.',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    Spacer(),
                    _TimeNotification(
                      controller: _timeNotification,
                      height: 5,
                      width: double.infinity,
                      color: widget.backgroundTime,
                      radius: 15,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class _TimeNotification extends StatefulWidget{
  const _TimeNotification({
    super.key,
    required this.controller,
    required this.height,
    required this.width,
    required this.color,
    required this.radius
  });

  final double height;
  final double width;
  final AnimationController controller;
  final Color color;
  final double radius;


  @override
  State<_TimeNotification> createState() => _TimeNotificationState();
}
class _TimeNotificationState extends State<_TimeNotification> with TickerProviderStateMixin {

  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _widthAnimation = Tween<double>(begin: 0, end: widget.width)
        .animate(CurvedAnimation(parent: widget.controller, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedBuilder(
          animation: _widthAnimation, 
          builder: (context, child) {
            return Container(
              width: _widthAnimation.value,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(widget.radius),
                  bottomRight: Radius.circular(widget.radius)
                )
              ),
            );
          }
        ),
      ),
    );
  }
}
