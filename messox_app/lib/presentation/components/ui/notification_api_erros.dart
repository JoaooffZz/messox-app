import 'package:flutter/material.dart';
import '../../../core/colors/mutable/notification_system_error.dart';
import '../../../core/texts/notifications/texts_notification.dart';
import '../../../server/exceptions/api.dart';
import '../notification/system_error.dart';

class NotificationsApiErrors {

  static void show(BuildContext context, NotificationSystemErrorTheme theme, 
      TextsNotifications texts, Exception errors) {

    switch(errors){
      case RequestException():
        final exception = texts.exceptions.api.errorRequest;
        _showNotificationException(context, theme, exception.preview, texts.close, exception.messages);
        break;
      case ConnectionServerException():
        final exception = texts.exceptions.api.connectionServer;
        _showNotificationException(context, theme, exception.preview, texts.close, exception.messages);
        break;
      case TimeOutRequestException():
        final exception = texts.exceptions.api.timeOut;
        _showNotificationException(context, theme, exception.preview, texts.close, exception.messages);
        break;
    }
  }
}

void _showNotificationException(BuildContext context, NotificationSystemErrorTheme theme, 
      String preview, TextsClose close, List<String> messages){
    
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) => NotificationSystemError(
      entry: entry, 
      preview: preview,
      textTimeFirst: close.first,
      textTimeLast: close.last,
      content: DefaultTextStyle(
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: theme.textContent,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              messages.length, 
              (i) {
                return Text(
                  messages[i],
                  textAlign: TextAlign.center,
                );
              }
            ),
          ),
        ),
      ),
      time: 3,
      textPreviewColor: theme.textPreview,
      background: theme.background,
      boxContentColor: theme.boxContent,
      backgroundTimeColor: theme.backgroundTime,
      textTimeColor: theme.textTime,
      actionsColor: theme.actions,
      shadowColor: theme.shadow,
    ),
  );
  overlay.insert(entry);
}
