import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final BorderRadius _borderRadius = BorderRadius.circular(32);

  PrimaryButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        width: 358,
        height: 67,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: AppColors.greenGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: _borderRadius,
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyle.mediumText18.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
