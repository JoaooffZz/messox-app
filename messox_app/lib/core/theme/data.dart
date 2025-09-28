import '../colors/mutable/notification_system_error.dart';
import '../colors/mutable/notification_system_not_auth.dart';
import '../colors/mutable/notification_system_sucess.dart';
import 'dark.dart';

class ThemeData {

  late NotificationSystemErrorTheme notificationSystemErrorTheme;
  late NotificationSystemSucessTheme notificationSystemSucessTheme;
  late NotificationSystemNotAuthTheme notificationSystemNotAuthTheme;

  void upTheme(String theme) {
    switch(theme) {
      case 'dark':
        _dark();
        break;
      case 'light':
        _light();
        break;
    }
  }

  void _dark() {
    final dark = Dark.build();
    notificationSystemErrorTheme = dark.notificationSystemErrorTheme;
    notificationSystemSucessTheme = dark.notificationSystemSucessTheme;
    notificationSystemNotAuthTheme = dark.notificationSystemNotAuthTheme;
  }

  void _light() {

  }
}