import 'dart:async';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/features/splash/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(
      const Duration(seconds: 2),
      navigateToOnboarding,
    );
  }

  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(
      context,
      NamedRoute.initial,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'financy',
              style: AppTextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 20),
            const CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
