import 'package:financy_app/common/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> singUp({
    String? name,
    required String email,
    required String password,
  });
  Future<UserModel> singIn({
    required String email,
    required String password,
  });
  Future<void> singOut();
}
