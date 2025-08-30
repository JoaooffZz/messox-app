import 'package:flutter/material.dart';
import 'package:messox_app/presentation/components/notification/time.dart';
import '../buttons/button_svg.dart';
import '../animations/lottie.dart';


class NotificationSystemSucess extends StatefulWidget{
  const NotificationSystemSucess({
    super.key,
    required this.entry,
    required this.preview,
    required this.time,
    required this.textPreview,
    required this.background,
    required this.backgroundTime,
    required this.textTime,
    required this.actions,
    required this.shadow
  });
  
  final OverlayEntry entry;
  final String preview;
  final int time;
  final Color textPreview;
  final Color background;
  final Color backgroundTime;
  final Color textTime;
  final Color actions;
  final Color shadow;

  static void show(BuildContext context, 
    String preview, int time, 
    Color textPreview, Color background, Color backgroundTime, 
    Color textTime, Color actions, Color shadow) {
      final overlay = Overlay.of(context);
      late OverlayEntry entry;

      entry = OverlayEntry(
        builder: (context) => NotificationSystemSucess(
          entry: entry,
          preview: preview,
          time: time,
          textPreview: textPreview,
          background: background,       
          backgroundTime: backgroundTime,
          textTime: textTime,
          actions: actions,
          shadow: shadow,
        ),
      );
      overlay.insert(entry);
  }

  @override
  State<NotificationSystemSucess> createState() => _SystemState();
}

class _SystemState extends State<NotificationSystemSucess> with TickerProviderStateMixin{
  late final AnimationController _timeNotification;
  late AnimationController _notification;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _timeNotification = AnimationController(
      vsync: this, duration: Duration(seconds: widget.time)
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
    _timeNotification.dispose();
    _notification.dispose();
    super.dispose();
  }

  void _event() {
    _notification.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _timeNotification.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            return;
          }
          widget.entry.remove();
        });
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
        child: Container(
          height: heightMQ * 0.2,
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: widthMQ * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _preview(heightMQ * 0.05),
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
            lottie: 'assets/lotties/ok.json',
            repeat: false,
          ),
          const SizedBox(width: 10),
          DefaultTextStyle(
            style: TextStyle(
              color: widget.textPreview,
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),
            child: Text(widget.preview),
          ),
          Spacer(),
          const SizedBox(width: 10),
          ButtonSvg(
            width: 30, 
            height: 30, 
            onTap: _event, 
            svg: 'assets/svgs/exit.svg', 
            color: widget.actions
          ),
          const SizedBox(width: 10)
        ],
      ),
    );
  }
  Widget _time(double heightMQ, double widthMQ) {
    return Container(
      height: heightMQ * 0.030,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.backgroundTime,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15), 
          bottomRight: Radius.circular(15)
        ),
        boxShadow: [
          BoxShadow(
            color: widget.shadow,
            blurRadius: 2,
            offset: Offset(0, 4)
          )
        ]
      ),
      clipBehavior: Clip.antiAlias, // recorta tudo que ultrapassar
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-0.6, -0.8),
            child: DefaultTextStyle(
              style: TextStyle(
                color: widget.textTime,
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
              color: Color(0xff00F977), 
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
