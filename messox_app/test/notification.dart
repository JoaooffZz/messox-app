import 'package:flutter/material.dart';

import 'package:messox_app/presentation/components/notification/system_error.dart';
import 'package:messox_app/presentation/components/notification/system_sucess.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    // Desativa os warnings de overflow no debug
    return const SizedBox.shrink();
  };
  runApp(const MaterialApp(
    home: NotificationDemoScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class NotificationDemoScreen extends StatelessWidget {
  const NotificationDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff65FFBB),
      // appBar: AppBar(title: const Text("Demo Notification")),
      body: Center(
        child: ElevatedButton(
          // onPressed: () => _error(context),
          onPressed: () => _sucess(context),
          child: const Text("Mostrar Notificação"),
        ),
      ),
    );
  }
}

void _error(BuildContext context) {
  final preview = 'Erro test';
  final content = DefaultTextStyle(
    style: const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Server did not respond with the expected code'),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: 'code received: '),
              TextSpan(
                text: '500',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  final time = 10;
  final textPreview = Colors.white;
  final background = const Color(0xff444446);
  final boxContent = const Color(0xffD0D0D1);
  final backgroundTime = const Color(0xffAFAEB2);
  final textTime = Colors.white;
  final actions = const Color(0xffAFAEB2);
  final shadow = Colors.black.withOpacity(0.5);

  // Agora sim chama o show com os valores definidos
  NotificationSystemError.show(
    context,
    preview,
    content,
    time,
    textPreview,
    background,
    boxContent,
    backgroundTime,
    textTime,
    actions,
    shadow,
  );
}

void _sucess(BuildContext context) {
  NotificationSystemSucess.show(
    context, 
    'Conexão estabelecida', 
    3, 
    Colors.black, 
    Colors.white, 
    Color(0xffE6E6E7), 
    Colors.black.withOpacity(0.6), 
    Color(0xff77767B), 
    Colors.black.withOpacity(0.3)
  );
}