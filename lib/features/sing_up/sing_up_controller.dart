import 'dart:math';

import 'package:financy_app/features/sing_up/sing_up_state.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class SingUpController extends ChangeNotifier {
  final AuthService _service;

  SingUpController(this._service);

  SingUpState _state = SingUpInitialState();

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
    _changeState(SingUpLoadingState());
    try {
      await _service.singUp(
        name: name,
        email: email,
        password: password,
      );

      _changeState(SingUpSuccessState());
    } catch (e) {
      _changeState(SingUpErrorState(e.toString()));
    }
  }
}
