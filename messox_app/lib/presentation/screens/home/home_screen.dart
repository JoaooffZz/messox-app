import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../components/double_toggle_carousel.dart';
import 'bottom_nav_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _leftController;
  late AnimationController _rightController;

  @override
  void initState() {
    super.initState();

    _leftController = AnimationController(vsync: this);
    _rightController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _leftController.dispose();
    _rightController.dispose();
    super.dispose();
  }

  void playLeftAnimation() {
    _leftController
      ..reset()
      ..forward();
  }

  void playRightAnimation() {
    _rightController
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    final widthMQ = MediaQuery.of(context).size.width;
    final heightMQ = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff262626),
      extendBody: true,
      bottomNavigationBar: BottomNavHome(
        width: widthMQ,
        height: heightMQ * 0.08,
        child: DoubleToggleCarousel(
          duration: 200,
          color: Colors.transparent,
          colorCarousel: const Color(0xff00F977).withOpacity(0.8),
          width: widthMQ,
          height: double.infinity,
          padding: 8,
          borderRadiusToggle: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          radiusCarousel: 10,
          onEventLeft: playLeftAnimation,
          toggleLeft: SizedBox(
            height: 32,
            width: 32,
            child: Lottie.asset(
              'assets/lotties/chat-black.json',
              controller: _leftController,
              onLoaded: (composition) {
                _leftController.duration = composition.duration;
              },
            ),
          ),
          onEventRight: playRightAnimation,
          toggleRight: SizedBox(
            height: 32,
            width: 32,
            child: Lottie.asset(
              'assets/lotties/settings-black.json',
              controller: _rightController,
              onLoaded: (composition) {
                _rightController.duration = composition.duration;
              },
            ),
          ),
        ),
      ),
    );
  }
}
