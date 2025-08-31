import 'package:flutter/material.dart';

import '../../../core/colors/mutable/notification_system_error.dart';
import '../../../core/texts/notifications/error_request.dart';
import '../notification/system_error.dart';

class NotificationApiErros {
  static void showErrorRequest(BuildContext context, 
    NotificationSystemErrorTheme theme, ErrorRequestTexts texts, int code){
      
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(texts.content.body),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: theme.textContent,
                  ),
                  children: [
                    TextSpan(text: texts.content.code),
                    TextSpan(
                      text: "$code",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
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