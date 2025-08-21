import '../colors/immutable/acess.dart';
import '../colors/immutable/form_server.dart';
import '../colors/immutable/pre_loading.dart';
import '../colors/mutable/notification_system_error.dart';
import '../colors/mutable/notification_system_sucess.dart';

class ThemeData {
  // immutables colors
  late final PreLoadingColors preLoadingColors;
  late final FormServerColors formServerColors;
  late final AcessColors acessColors;

  // mutable colors
  late NotificationSystemErrorTheme notificationSystemErrorTheme;
  late NotificationSystemSucessTheme notificationSystemSucessTheme;

  void run(String theme) {
  }

  void up(String theme) {
  }
}