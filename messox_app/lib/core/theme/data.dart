// import '../colors/immutable/acess.dart';
// import '../colors/immutable/server_form.dart';
// import '../colors/immutable/pre_loading.dart';
import '../colors/mutable/notification_system_error.dart';
import '../colors/mutable/notification_system_sucess.dart';
import 'dark.dart';

class ThemeData {
  // immutables colors
  // final PreLoadingColors preLoadingColors = PreLoadingColors();
  // final FormServerColors formServerColors = FormServerColors();
  // final AcessColors acessColors = AcessColors();

  // mutable colors
  late NotificationSystemErrorTheme notificationSystemErrorTheme;
  late NotificationSystemSucessTheme notificationSystemSucessTheme;

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
  }

  void _light() {

  }
}