import 'package:financy_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60.0),
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.iceWithe,
              child: Image.asset('/images/man.png'),
            ),
          ),
          Expanded(
            child: Container(
              height: 150,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
