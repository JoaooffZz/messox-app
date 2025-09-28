import 'package:flutter/material.dart';

class StaggeredTextAnimation extends StatefulWidget {
  final TextStyle textStyle;
  final Duration duration;
  final List<String> texts;

  const StaggeredTextAnimation({
    super.key,
    required this.textStyle,
    required this.texts,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<StaggeredTextAnimation> createState() => _StaggeredTextAnimationState();
}

class _StaggeredTextAnimationState extends State<StaggeredTextAnimation>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _animations;

  int _currentText = 0;
  late String text;

  @override
  void initState() {
    super.initState();

    text = widget.texts[_currentText];
    _goAnimations();

    // _controllers = List.generate(text.length, (index) {
      // final controller = AnimationController(
      //   vsync: this,
    //     duration: widget.duration,
    //   );

    //   Future.delayed(Duration(milliseconds: 90 * index), () {
    //     controller.forward();
    //   });

    //   return controller;
    // });

    // _animations = _controllers.map((controller) {
    //   return Tween<Offset>( 
    //     begin: const Offset(0, 0),
    //     end: const Offset(0, 0.5),
    //   ).animate(
    //     CurvedAnimation(
    //       parent: controller,
    //       curve: Curves.easeOutCubic, // começa rápido, termina devagar
    //     ),
    //   );
    // }).toList();
    // _out();
  }

  void _goAnimations() {
  // _controllers.clear();  
    _controllers = List.generate(text.length, (index) {
      final controller = AnimationController(
        vsync: this,
        duration: widget.duration,
      );

      Future.delayed(Duration(milliseconds: 75 * index), () {
        controller.forward();
      });

      return controller;
    });

    _animations = _controllers.map((controller) {
      return Tween<Offset>( 
        begin: const Offset(0, 0),
        end: const Offset(0, 0.5),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeOutCubic, // começa rápido, termina devagar
        ),
      );
    }).toList();
    _out();
  }

  void _out() {
    final lastIndex = _controllers.length - 1;
    final firstController = _controllers[0];
    final lastController = _controllers[lastIndex];

    lastController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        for (var i = lastIndex; i >= 0; i--) {
          var contlr = _controllers[i];
          final delay = Duration(milliseconds: 40 * (lastIndex - i)); // <- inverso
          Future.delayed(delay, () {
            contlr.reverse();
          });
        }
      }
    });
    firstController.addStatusListener((status){
      if (status == AnimationStatus.dismissed) {
        _newText();
        // for (var i = 0; i <= _controllers.length-1; i++) {
        //   var contlr = _controllers[i];
        //   final delay = Duration(milliseconds: 90 * i); // <- inverso
        //   Future.delayed(delay, () {
        //     contlr.forward();
        //   });
        // }
      }
    });
  }
  void _newText() {
    _currentText++;
    if (_currentText > widget.texts.length-1) {
      _currentText = 0;
    } 
    text = widget.texts[_currentText];
    _goAnimations();
    setState(() {});
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(text.length, (index) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: _controllers[index],
            curve: Curves.easeInOut, // curva para o fade
          ),
          child: SlideTransition(
            position: _animations[index],
            child: DefaultTextStyle(
              style: widget.textStyle, 
              child: Text(
                text[index],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ),
          ),
        );
      }),
    );
  }
}