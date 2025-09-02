import 'package:flutter/material.dart';

import '../../../core/colors/mutable/notification_system_error.dart';
import '../../../core/texts/notifications/not_auth.dart';
import '../../../core/texts/notifications/request_error.dart';
import '../notification/system_error.dart';

class NotificationApiErros {
  static void showRequestError(BuildContext context, 
    NotificationSystemErrorTheme theme, RequestErrorTexts texts, int code){
      
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => NotificationSystemError(
        entry: entry, 
        preview: texts.preview,
        content: DefaultTextStyle(
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: theme.textContent,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  texts.content.body,
                  textAlign: TextAlign.center
                ),
                Text.rich(
                  TextSpan(
                    text: texts.content.code,
                    children: [
                      TextSpan(
                        text: " $code",
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
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

  static void showNotAuth(BuildContext context, 
    NotificationSystemErrorTheme theme, NotAuthTexts texts){
      
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => NotificationSystemError(
        entry: entry, 
        preview: texts.preview,
        content: DefaultTextStyle(
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: theme.textContent,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  texts.content.body,
                  textAlign: TextAlign.center
                ),
                Text(
                  texts.content.warning,
                  textAlign: TextAlign.center
                ),
              ],
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

}