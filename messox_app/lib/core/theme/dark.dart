import 'package:flutter/rendering.dart';

import '../colors/mutable/notification_system_error.dart';
import '../colors/mutable/notification_system_not_auth.dart';
import '../colors/mutable/notification_system_sucess.dart';

class Dark {

  final NotificationSystemErrorTheme notificationSystemErrorTheme;
  final NotificationSystemSucessTheme notificationSystemSucessTheme;
  final NotificationSystemNotAuthTheme notificationSystemNotAuthTheme;

  Dark({
    required this.notificationSystemErrorTheme,
    required this.notificationSystemSucessTheme,
    required this.notificationSystemNotAuthTheme
  }); 

  factory Dark.build() => Dark(
    notificationSystemErrorTheme: NotificationSystemErrorTheme(
      textPreview: Color(0xffFE6B72),
      textTime: Color(0xffF5F5F6),
      textContent: Color(0xffFF0800),
      shadow: Color(0xff000000).withOpacity(0.5),
      actions: Color(0xffE6E6E7),
      background: Color(0xff444446),
      backgroundTime: Color(0xffAFAEB2),
      boxContent: Color(0xff868686)
    ), 
    notificationSystemSucessTheme: NotificationSystemSucessTheme(
      actions: Color(0xffE6E6E7),
      textPreview: Color(0xff65ffbb),
      textTime: Color(0xffF5F5F6),
      background: Color(0xff444446),
      backgroundTime: Color(0xffAFAEB2),
      shadow: Color(0xff000000).withOpacity(0.5)
    ),
    notificationSystemNotAuthTheme: NotificationSystemNotAuthTheme(
      textPreview: Color(0xffF3DD1C),
      textTime: Color(0xffF5F5F6),
      time: Color(0xffFBF88D),
      textContent: Color(0xff000000),
      shadow: Color(0xff000000).withOpacity(0.5),
      actions: Color(0xffE6E6E7),
      background: Color(0xff444446),
      backgroundTime: Color(0xffAFAEB2),
      boxContent: Color(0xff868686)
    )
  );
}