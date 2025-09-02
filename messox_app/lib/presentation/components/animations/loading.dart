import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../ui/glass_panel.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent, // deixa transparente atrás
      builder: (context) {
        return LoadingDialog();
      },
    );
  }

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // importante pro efeito
      body: GlassPanel(
        width: double.infinity,
        height: double.infinity,
        blurSigma: 1.5,
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
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
