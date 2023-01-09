import 'dart:async';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_style.dart';
import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/features/splash/splash_controller.dart';
import 'package:financy_app/features/splash/splash_state.dart';
import 'package:financy_app/locator.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashStateSuccess) {
        Navigator.pushReplacementNamed(
          context,
          NamedRoute.home,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          NamedRoute.initial,
        );
      }
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
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
              style: AppTextStyle.bigText.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 20),
            const CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
