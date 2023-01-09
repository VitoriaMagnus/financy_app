import 'package:financy_app/services/auth_service.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'sing_in_state.dart';

class SingInController extends ChangeNotifier {
  final AuthService _service;

  SingInController(this._service);

  SingInState _state = SingInStateInitial();

  SingInState get state => _state;

  void _changeState(SingInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> singIn({
    required String email,
    required String password,
  }) async {
    const secureStorage = SecureStorage();

    _changeState(SingInStateLoading());
    try {
      final user = await _service.singIn(
        email: email,
        password: password,
      );

      if (user.id != null) {
        secureStorage.write(key: 'CURRENT_USER', value: user.toJson());
        _changeState(SingInStateSuccess());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SingInStateError(e.toString()));
    }
  }
}
