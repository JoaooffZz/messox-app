import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../ui/glass_panel.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent, // deixa transparente atrás
      builder: (context) {
        return Loading();
      },
    );
  }

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // importante pro efeito
      body: GlassPanel(
        width: double.infinity,
        height: double.infinity,
        blurSigma: 25,
        opacity: 0.15,
        borderOpacity: 0.15,
        child: Center(
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Color(0xffecfff5),
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: LottieBuilder.asset(
              'assets/lotties/loading.json',
              // repeat: true,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
