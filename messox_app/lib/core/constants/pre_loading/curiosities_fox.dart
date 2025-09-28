
class CuriositiesFox {
  final String language;

  CuriositiesFox({required this.language});

  List<String> get() {
    switch (language.toLowerCase()) {
      case 'en-us':
        return _enusCuriosities;
      case 'pt-br':
      default:
        return _ptbrCuriosities;
    }
  }

  static const List<String> _enusCuriosities = [
    'Foxes are incredibly adaptable.',
    'Have ultra-sensitive hearing.',
    'Nocturnal and crepuscular habits.',
    'Can jump up to 10 feet.',
    'Their tail helps with balance.',
    'Communicate with high-pitched sounds.',
    'Kits are born blind and deaf.',
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
    'Possuem audição ultra-sensível.',
    'Usam o campo magnético para caçar.',
    'Podem pular até 3 metros de altura.',
    'Sua cauda ajuda no equilíbrio.',
    'Comunicam-se com sons agudos.',
    'Filhotes nascem cegos e surdos.',
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