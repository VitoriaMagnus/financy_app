import 'package:financy_app/common/models/user_model.dart';
import 'package:financy_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> singIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode.toString(),
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Erro ao logar. Tente novamente.';
      }
      throw 'Não foi possivel realizar login nesse momento. Tente mais tarde.';
    }
  }

  @override
  Future<UserModel> singUp({
    String? name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode.toString(),
        name: name,
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura. Digite uma senha forte.';
      }
      throw 'Não foi possivel criar sua conta nesse momento. Tente mais tarde.';
    }
  }

  @override
  Future<void> singOut() {
    // TODO: implement singOut
    throw UnimplementedError();
  }
}
