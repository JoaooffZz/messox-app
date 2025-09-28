part of 'server_form_screen.dart';

mixin ValidatorFormMixins{

  // Validator para Name
  String? Function(String?) nameValidator(texts.Name n) {
    return (String? val) {
      if (val == null || val.isEmpty) {
        return n.notEmpty;
      }
      return null; // sem erro
    };
  }

  // Validator para Host
  String? Function(String?) hostValidator(texts.Host h) {
    return (String? val) {
      if (val == null || val.isEmpty) {
        return h.notEmpty;
      }
      return null; // sem erro
    };
  }

  // Validator para Scheme
  String? Function(String?) schemeValidator(texts.Scheme t) {
    return (String? val) {
      if (val == null || val.isEmpty) {
        return t.notEmpty;
      }
      if (val != "http" && val != "https") { // corrigi a lógica: AND, não OR
        return t.notHttp;
      }
      return null; // sem erro
    };
  }

}