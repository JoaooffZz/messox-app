
import 'dart:math';

class LottieFox {
  final List<String> _foxAnimations = [
    'assets/lotties/fox-audio.json',
    'assets/lotties/fox-dev.json',
    // 'assets/lotties/fox-hello.json',
    // 'assets/lotties/fox-magic.json',
  ];

  final Random _random = Random();

  String get() {
    return _foxAnimations[_random.nextInt(_foxAnimations.length)];
  }
}