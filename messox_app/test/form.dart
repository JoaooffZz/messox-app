import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messox_app/presentation/components/ui/form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  bool _ignoring = false;
  bool required = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FormCustom Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormCustom(
              isRequired: true,
              formKey: _formKey,
              controller: _controller,
              svg: SvgPicture.asset(
                'assets/svgs/user.svg', // coloque um SVG válido
                width: 24,
                height: 24,
              ),
              labelText: 'Digite algo',
              background: Color(0xff86868A),
              shadow: Colors.black.withOpacity(0.3),
              ignoring: _ignoring,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _ignoring = !_ignoring; // alterna a variável
                });
              },
              child: Text(_ignoring ? 'Ativar Campo' : 'Desativar Campo'),
            ),
          ],
        ),
      ),
    );
  }
}

