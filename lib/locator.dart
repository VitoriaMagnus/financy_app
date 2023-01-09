import 'package:financy_app/features/sing_in/sing_in_controller.dart';
import 'package:financy_app/features/sing_up/sing_up_controller.dart';
import 'package:financy_app/features/splash/splash_controller.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'services/auth_service.dart';
import 'services/firebase_auth_service.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());

  locator.registerFactory<SplashController>(
      () => SplashController(const SecureStorage()));

  locator.registerFactory<SingInController>(
      () => SingInController(locator.get<AuthService>()));

  locator.registerFactory<SingUpController>(
      () => SingUpController(locator.get<AuthService>()));
}
