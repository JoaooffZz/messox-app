import 'package:flutter/material.dart';
import 'package:messox_app/presentation/components/animations/loading.dart';
// importa o arquivo onde está a sua classe Loading
// import 'loading.dart';

// import 'package:flutter/material.dart';
// // import 'loading.dart'; // importa seu Loading

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          // // imagem de fundo
          // Positioned.fill(
          //   child: Image.network(
          //     "https://images.unsplash.com/photo-1506744038136-46273834b3fb", // floresta do Unsplash
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // conteúdo por cima da imagem
          Center(
            child: ElevatedButton(
              onPressed: () {
                Loading.show(context);
              },
              child: const Text("Mostrar Loading"),
            ),
          ),
        ],
      ),
    );
  }
}

