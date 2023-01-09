import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/themes/default_theme.dart';
import 'package:financy_app/features/onboarding/onboarding_screen.dart';
import 'package:financy_app/features/sing_in/sing_in_screen.dart';
import 'package:financy_app/features/sing_up/sing_up_screen.dart';
import 'package:financy_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnboardingScreen(),
        NamedRoute.splash: (context) => const SplashScreen(),
        NamedRoute.signUp: (context) => const SingUpScreen(),
        NamedRoute.singIn: (context) => const SingInScreen(),
      },
    );
  }
}
