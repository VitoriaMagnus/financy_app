import 'package:financy_app/features/sing_up/sing_up_state.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class SingUpController extends ChangeNotifier {
  final AuthService _service;

  SingUpController(this._service);

  SingUpState _state = SingUpStateInitial();

  SingUpState get state => _state;

  void _changeState(SingUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> singUp({
    required String? name,
    required String email,
    required String password,
  }) async {
    _changeState(SingUpStateLoading());
    try {
      await _service.singUp(
        name: name,
        email: email,
        password: password,
      );

      _changeState(SingUpStateSuccess());
    } catch (e) {
      _changeState(SingUpStateError(e.toString()));
    }
  }
}
