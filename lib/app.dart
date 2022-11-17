import 'package:financy_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'features/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
