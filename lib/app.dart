import 'package:financy_app/common/themes/default_theme.dart';
import 'package:financy_app/features/onboarding/onboarding_screen.dart';
import 'package:financy_app/features/sing_up/sing_up_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: const SingUpScreen(),
    );
  }
}
