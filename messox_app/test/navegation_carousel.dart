import 'package:flutter/material.dart';
import 'package:messox_app/presentation/components/ui/navegation_bar_carousel.dart' show NavegationBarCarousel;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: const SafeArea(
          child: Center(
            child: TestCarousel(),
          ),
        ),
      ),
    );
  }
}

class TestCarousel extends StatefulWidget {
  const TestCarousel({super.key});

  @override
  State<TestCarousel> createState() => _TestCarouselState();
}

class _TestCarouselState extends State<TestCarousel> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Selecionado: $selected',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        NavegationBarCarousel(
          width: 350,
          height: 60,
          toggles: const [
            Text('Home', style: TextStyle(fontSize: 16)),
            Text('Perfil', style: TextStyle(fontSize: 16)),
            Text('Chat', style: TextStyle(fontSize: 16)),
            Text('Config', style: TextStyle(fontSize: 16)),
            Text('Mais', style: TextStyle(fontSize: 16)),
          ],
          background: Colors.grey.shade300,
          colorCarousel: Colors.greenAccent,
          borderRadiusCarousel: BorderRadius.circular(25),
          borderRadius: BorderRadius.circular(30),
          onToggle: (index) {
            setState(() {
              selected = index;
            });
          },
        ),
      ],
    );
  }
}
