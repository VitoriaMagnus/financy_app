import 'package:financy_app/features/sing_in/sing_in_controller.dart';
import 'package:financy_app/features/sing_up/sing_up_controller.dart';
import 'package:financy_app/services/mock_auth_service.dart';
import 'package:get_it/get_it.dart';

import 'services/auth_service.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => MockAuthService());

  locator.registerFactory<SingInController>(
      () => SingInController(locator.get<AuthService>()));

  locator.registerFactory<SingUpController>(
      () => SingUpController(locator.get<AuthService>()));
}
