import 'package:financy_app/services/auth_service.dart';
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
    _changeState(SingInStateLoading());
    try {
      await _service.singIn(
        email: email,
        password: password,
      );

      _changeState(SingInStateSuccess());
    } catch (e) {
      _changeState(SingInStateError(e.toString()));
    }
  }
}
