
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/texts/screens/server_form.dart';
import '../../blocs/server_form/bloc.dart' as bloc;

class ProviderServerForm with ChangeNotifier {
  late AnimationController _textFadeControl;

  // settings of forms:
  final _focusName = FocusNode();
  late List<FilteringTextInputFormatter> _inputName;
  late GlobalKey<FormState> _keyName;
  late TextEditingController _controlName;

  final _focusHost = FocusNode();
  late List<FilteringTextInputFormatter> _inputHost;
  late GlobalKey<FormState> _keyHost;
  late TextEditingController _controlHost;

  final _focusScheme = FocusNode();
  late List<FilteringTextInputFormatter> _inputScheme;
  late GlobalKey<FormState> _keyScheme;
  late TextEditingController _controlScheme;

  final _focusApiKey = FocusNode();
  late GlobalKey<FormState> _keyApiKey;
  late TextEditingController _controlApiKey;

  // settings screen:
  late Texts _texts;

  // states:
  bool _isIgnoring = false;

  // bloc:
  late void Function(bloc.ServerFormEvents) _inputEvent;

  /// --- Getters ---
  AnimationController get textFadeControl => _textFadeControl;

  FocusNode get focusName => _focusName;
  List<FilteringTextInputFormatter> get inputName => _inputName;
  GlobalKey<FormState> get keyName => _keyName;
  TextEditingController get controlName => _controlName;

  FocusNode get focusHost => _focusHost;
  List<FilteringTextInputFormatter> get inputHost => _inputHost;
  GlobalKey<FormState> get keyHost => _keyHost;
  TextEditingController get controlHost => _controlHost;

  FocusNode get focusScheme => _focusScheme;
  List<FilteringTextInputFormatter> get inputScheme => _inputScheme;
  GlobalKey<FormState> get keyScheme => _keyScheme;
  TextEditingController get controlScheme => _controlScheme;

  FocusNode get focusApiKey => _focusApiKey;
  GlobalKey<FormState> get keyApiKey => _keyApiKey;
  TextEditingController get controlApiKey => _controlApiKey;

  Texts get texts => _texts;

  bool get isIgnoring => _isIgnoring;

  /// --- Init ---
  void init(TickerProvider vsync, Texts texts, void Function(bloc.ServerFormEvents) inputEvent) {
    _texts = texts;
    _inputEvent = inputEvent;

    // fade text
    _textFadeControl = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 900),
    );

    // form name server
    _keyName = GlobalKey<FormState>();
    _controlName = TextEditingController();
    _inputName = [
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9.\-]')),
    ];

    // form host server
    _keyHost = GlobalKey<FormState>();
    _controlHost = TextEditingController();
    _inputHost = [
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9.\-]')),
    ];

    // form scheme server
    _keyScheme = GlobalKey<FormState>();
    _controlScheme = TextEditingController();
    _inputScheme = [
      FilteringTextInputFormatter.allow(RegExp(r'[a-z]')),
    ];

    // form api key
    _keyApiKey = GlobalKey<FormState>();
    _controlApiKey = TextEditingController();
  }

  void clearFocus() => [_focusScheme,_focusHost,_focusName,_focusApiKey]
      .forEach((e) => e.unfocus());

  void ignoring(){
    _isIgnoring = !_isIgnoring;
    notifyListeners();
  }

  bool _authValidetors() {
    final statesKey = [
        keyName.currentState, 
        keyApiKey.currentState, 
        keyScheme.currentState, 
        keyHost.currentState];
    
    if(statesKey.every((e) => e == null)) return false;

    List<bool> val = [];
    final iterator = statesKey.iterator;
    while (iterator.moveNext()) {
      final item = iterator.current;
      val.add(item!.validate());
    }

    if (val.any((e) => e == false)) return false;

    return true;
  }
  void event() {
    clearFocus();
    if (_authValidetors()) {
      ignoring(); 
      _inputEvent(bloc.AuthConnection(
        name: _controlName.text, 
        host: _controlHost.text, 
        scheme: _controlScheme.text, 
        apiKey: _controlApiKey.text 
      ));
    }
  }
  @override
  void dispose() {
    _textFadeControl.dispose();
    _focusName.dispose();
    _controlName.dispose();
    _focusHost.dispose();
    _controlHost.dispose();
    _focusScheme.dispose();
    _controlScheme.dispose();
    _focusApiKey.dispose();
    _controlApiKey.dispose();
    super.dispose();
  }  
}
