import 'package:financy_app/common/models/user_model.dart';
import 'package:financy_app/features/sing_up/sing_up_state.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:financy_app/services/secure_storage.dart';
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
    final secureStorage = SecureStorage();

    _changeState(SingUpStateLoading());
    try {
      final user = await _service.singUp(
        name: name,
        email: email,
        password: password,
      );

      if (user.id != null) {
        await secureStorage.write(
          key: 'CURRENT_USER',
          value: user.toJson(),
        );
        _changeState(SingUpStateSuccess());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SingUpStateError(e.toString()));
    }
  }
}
