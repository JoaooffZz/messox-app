import 'package:flutter/cupertino.dart';
import 'package:messox_app/presentation/routes/animations.dart';
import '../screens/access/access_screen.dart';

class RoutesServerForm{
  static void goAcess(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      goRouteSlideFromRight(AccessScreen()),
      (router) => false,
    );
  }
}