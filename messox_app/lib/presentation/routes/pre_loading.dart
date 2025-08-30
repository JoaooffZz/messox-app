
import 'package:flutter/material.dart';
import 'package:messox_app/presentation/routes/animations.dart';

import '../screens/access/access_screen.dart';
import '../screens/server_form/server_form_screen.dart';
import '../screens/home/home_screen.dart';

class RoutesPreLoading {
  static void goServer(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      goRouteFadeEase(ServerFormScreen()),
      (route) => false,
    );
  }

  static void goAcess(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      goRouteFadeEase(AccessScreen()),
      (route) => false,
    );
  }

  static void goHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      goRouteFadeEase(HomeScreen()),
      (route) => false,
    );
  }
}
