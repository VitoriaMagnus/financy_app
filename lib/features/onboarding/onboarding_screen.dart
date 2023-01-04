import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_style.dart';
import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/features/sing_up/sing_up_screen.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                color: AppColors.iceWithe,
                child: Padding(
                  padding: const EdgeInsets.only(top: 64.0, left: 8, right: 8),
                  child: Image.asset(
                    'assets/images/man.png',
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  'Spend Smarter',
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.greenLight),
                ),
              ),
              Text('Save More',
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.greenLight)),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      NamedRoute.signUp,
                    );
                  },
                  text: 'Get Stardted',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: MultiTextButton(
                  onPressed: () {},
                  children: [
                    Text(
                      'Already have account? ',
                      style: AppTextStyle.smallText
                          .copyWith(color: AppColors.darkGrey),
                    ),
                    Text(
                      'Log in',
                      style: AppTextStyle.smallText
                          .copyWith(color: AppColors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
