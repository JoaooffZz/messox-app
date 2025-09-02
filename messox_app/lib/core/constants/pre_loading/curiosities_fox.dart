import 'dart:math';

class CuriositiesFox {
  final String language;

  CuriositiesFox({required this.language});

  final Random _random = Random();

  /// Returns a random curiosity
  String get() {
    switch (language.toLowerCase()) {
      case 'en-us':
        return _enusCuriosities[_random.nextInt(_enusCuriosities.length)];
      case 'pt-br':
      default:
        return _ptbrCuriosities[_random.nextInt(_ptbrCuriosities.length)];
    }
  }

  static const List<String> _enusCuriosities = [
    'Foxes are incredibly adaptable.',
    // 'Live on every continent except Antarctica.',
    'Have ultra-sensitive hearing.',
    // 'Use Earth\'s magnetic field to hunt.',
    // 'Solitary animals, don\'t live in packs.',
    'Nocturnal and crepuscular habits.',
    // 'Omnivores—eat fruit and small animals.',
    'Can jump up to 10 feet.',
    'Their tail helps with balance.',
    'Communicate with high-pitched sounds.',
    'Kits are born blind and deaf.',
    // 'Fennec foxes survive scorching deserts.',
    'Some change color in winter.',
    'Excellent tree climbers.',
    'Hide food for later.',
    'Live up to 14 years captive.',
    'Have vertical pupils like cats.',
    'Mark territory with urine.',
    'Red foxes are the most common.',
    'Symbol of cunning in many cultures.',
  ];

  static const List<String> _ptbrCuriosities = [
    'Raposas são incrivelmente adaptáveis.',
    // 'Vivem em todos os continentes, exceto Antártida.',
    'Possuem audição ultra-sensível.',
    'Usam o campo magnético para caçar.',
    // 'São animais solitários, não vivem em matilhas.',
    // 'Têm hábitos noturnos e crepusculares.',
    // 'Onívoras, comem frutas e pequenos animais.',
    'Podem pular até 3 metros de altura.',
    'Sua cauda ajuda no equilíbrio.',
    'Comunicam-se com sons agudos.',
    'Filhotes nascem cegos e surdos.',
    // 'Raposas-das-areias suportam desertos escaldantes.',
    'Algumas mudam de cor no inverno.',
    'São ótimas escaladoras de árvores.',
    'Escondem comida para depois.',
    'Vivem até 14 anos em cativeiro.',
    'Têm pupilas verticais como gatos.',
    'Marcam território com urina.',
    'Raposas-vermelhas são as mais comuns.',
    'Símbolo de astúcia em muitas culturas.',
  ];
}