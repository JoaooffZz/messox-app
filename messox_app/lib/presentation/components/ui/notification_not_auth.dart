// import 'package:flutter/material.dart';

// import '../../../core/colors/mutable/notification_system_not_auth.dart';
// import '../../../core/texts/notifications/not_auth.dart';
// import '../notification/system_error.dart';

// class NotificationNotAuth {
//   static void show(BuildContext context, 
//       NotAuthTexts texts, NotificationSystemNotAuthTheme theme) {
        
//     final overlay = Overlay.of(context);
//     late OverlayEntry entry;

//     entry = OverlayEntry(
//       builder: (context) => NotificationSystemError(
//         entry: entry, 
//         preview: texts.preview,
//         lottie: 'assets/lotties/warning.json',
//         textTimeFirst: texts.close.first,
//         textTimeLast: texts.close.last,
//         content: DefaultTextStyle(
//           style: TextStyle(
//             fontFamily: 'Poppins',
//             fontSize: 13,
//             fontWeight: FontWeight.w300,
//             color: theme.textContent,
//           ),
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   texts.content.body,
//                   textAlign: TextAlign.center
//                 ),
//                 Text(
//                   texts.content.warning,
//                   textAlign: TextAlign.center
//                 ),
//               ],
//             ),
//           ),
//         ),
//         time: 3,
//         timeColor: theme.time,
//         textPreviewColor: theme.textPreview,
//         background: theme.background,
//         boxContentColor: theme.boxContent,
//         backgroundTimeColor: theme.backgroundTime,
//         textTimeColor: theme.textTime,
//         actionsColor: theme.actions,
//         shadowColor: theme.shadow,
//       ),
//     );
//     overlay.insert(entry);
//   }
// }