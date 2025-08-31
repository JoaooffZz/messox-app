import 'dart:math';

import 'package:flutter/material.dart';
import 'package:messox_app/presentation/components/notification/time.dart';
import '../buttons/button_svg.dart';
import '../animations/container_rotate.dart';
import '../animations/lottie.dart';


class NotificationSystemError extends StatefulWidget{
  const NotificationSystemError({
    super.key,
    required this.entry,
    required this.preview,
    required this.content,
    required this.time,
    required this.textPreviewColor,
    required this.background,
    required this.boxContentColor,
    required this.backgroundTimeColor,
    required this.textTimeColor,
    required this.actionsColor,
    required this.shadowColor
  });
  
  final OverlayEntry entry;
  final String preview;
  final DefaultTextStyle content;
  final int time;
  final Color textPreviewColor;
  final Color background;
  final Color boxContentColor;
  final Color backgroundTimeColor;
  final Color textTimeColor;
  final Color actionsColor;
  final Color shadowColor;

  static void show(BuildContext context, 
    String preview, DefaultTextStyle content, int time, 
    Color textPreview, Color background, Color boxContent,
    Color backgroundTime, Color textTime, Color actions, Color shadow) {
      final overlay = Overlay.of(context);
      late OverlayEntry entry;

      entry = OverlayEntry(
        builder: (context) => NotificationSystemError(
          entry: entry, 
          preview: preview,
          content: content,
          time: time,
          textPreviewColor: textPreview,
          background: background,
          boxContentColor: boxContent,
          backgroundTimeColor: backgroundTime,
          textTimeColor: textTime,
          actionsColor: actions,
          shadowColor: shadow,
        ),
      );
      overlay.insert(entry);
  }

  @override
  State<NotificationSystemError> createState() => _SystemState();
}

class _SystemState extends State<NotificationSystemError> with TickerProviderStateMixin{
  late final AnimationController _rotate;
  late final AnimationController _timeNotification;
  late AnimationController _notification;
  late Animation<Offset> _offsetAnimation;
  bool _isExpanded = false;
  bool _preSize = false;

  @override
  void initState() {
    super.initState();
    _timeNotification = AnimationController(
      vsync: this, duration: Duration(seconds: widget.time)
    );

    _rotate = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _notification = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -2.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _notification, curve: Curves.easeOut),
    );
    _notification.forward();
  }
  @override
  void dispose() {
    _rotate.dispose();
    _timeNotification.dispose();
    _notification.dispose();
    super.dispose();
  }

  void _arrow() {
    if (!_isExpanded) {
      _rotate.forward();
      _timeNotification.stop();
      setState(() {
        _preSize = true;
      });
      setState(() {
        _isExpanded = true;
      });
      return;
    }
    _rotate.reverse();
    _timeNotification.forward();
    setState(() {
      _isExpanded = false;
    });
    setState(() {
      _preSize = false;
    });
  }

  void _event() {
    _notification.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        if (status == AnimationStatus.completed) {
          return;
        }
        widget.entry.remove();
      }
    });
    _notification.reverse();
  }
  @override
  Widget build(BuildContext context) {
    final widthMQ = MediaQuery.of(context).size.width;
    final heightMQ = MediaQuery.of(context).size.height;

    return Positioned(
      top: 45,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: _preSize ? heightMQ * 0.2 : heightMQ * 0.08,
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: widthMQ * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _preview(heightMQ * 0.05),
                _content(heightMQ * 0.10),
                _time(heightMQ, widthMQ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _preview(double height) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15)
        )
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 10),
          Lottie(
            height: 26,
            width: 26,
            lottie: 'assets/lotties/error.json',
            repeat: false,
          ),
          const SizedBox(width: 10),
          DefaultTextStyle(
            style: TextStyle(
              color: widget.textPreviewColor,
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),
            child: Text(widget.preview),
          ),
          Spacer(),
          ContainerRotate(
            controller: _rotate,
            degress: -pi,
            content: ButtonSvg(
              height: 24,
              width: 24,
              onTap: _arrow,
              svg: 'assets/svgs/angle-down.svg',
              color: widget.actionsColor,
            ),
          ),
          const SizedBox(width: 10),
          ButtonSvg(
            width: 30, 
            height: 30, 
            onTap: _event, 
            svg: 'assets/svgs/exit.svg', 
            color: widget.actionsColor
          ),
          const SizedBox(width: 10)
        ],
      ),
    );
  }
  Widget _content(double height) {
    return ClipRect(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: _isExpanded ? height : 0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
          color: widget.background,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _isExpanded
              ? Container(
                  key: const ValueKey(1),
                  decoration: BoxDecoration(
                    color: widget.boxContentColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: widget.content,
                )
              : const SizedBox.shrink(key: ValueKey(2)),
        ),
      ),
    );
  }
  Widget _time(double heightMQ, double widthMQ) {
    return Container(
      height: heightMQ * 0.030,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.backgroundTimeColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15), 
          bottomRight: Radius.circular(15)
        ),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor,
            blurRadius: 2,
            offset: Offset(0, 4)
          )
        ]
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-0.6, -0.8),
            child: DefaultTextStyle(
              style: TextStyle(
                color: widget.textTimeColor,
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
              child: Text('this message will close in ${widget.time} seconds.'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TimeNotification(
              controller: _timeNotification, 
              height: 4,
              width: widthMQ * 0.9,
              color: Color(0xffFE6B72), 
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(2)
              ),
              event: _event,
            ),
          ),
        ],
      ),
    );
  }
}
