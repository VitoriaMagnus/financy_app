class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"^([A-z\'\.-ᶜ]*(\s))+[A-z\'\.-ᶜ]*$");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Nome inválido. Digite um nome válido';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'E-mail inválido. Digite um E-mail válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Senha inválida. Digite uma senha válida';
    }
    return null;
  }

  static String? validateConfirmPassword(String first, String? second) {
    if (first != second) {
      return 'As senhas são diferentes. Por favor, verifique as senhas e tente novamente.';
    }
    final condition =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (second != null && second.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    if (second != null && !condition.hasMatch(second)) {
      return 'Senha inválida. Digite uma senha válida';
    }
    return null;
  }
}
