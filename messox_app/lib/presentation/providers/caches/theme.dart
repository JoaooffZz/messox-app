// import 'package:flutter/widgets.dart';

// // import '../../core/colors/immutable/acess.dart';
// // import '../../core/colors/immutable/server_form.dart';
// // import '../../core/colors/immutable/pre_loading.dart';
// import '../../../core/colors/mutable/notification_system_error.dart';
// import '../../../core/colors/mutable/notification_system_sucess.dart';
// import '../../../core/theme/data.dart';

// class ThemeCacheProvider with ChangeNotifier{
//   final ThemeData _themeData = ThemeData();

//   // PreLoadingColors get preLoadingColors => _themeData.preLoadingColors;
//   // FormServerColors get formServerColors => _themeData.formServerColors;
//   // AcessColors get acessColors => _themeData.acessColors;

//   NotificationSystemErrorTheme get notificationSystemErrorTheme 
//     => _themeData.notificationSystemErrorTheme;
//   NotificationSystemSucessTheme get notificationSystemSucessTheme 
//     => _themeData.notificationSystemSucessTheme;

//   void upTheme(String theme) {
//     _themeData.upTheme(theme);
//     notifyListeners();
//   }
// }