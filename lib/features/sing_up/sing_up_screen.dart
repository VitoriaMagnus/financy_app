import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_style.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64.0),
              child: Text(
                'Spend Smarter',
                style: AppTextStyle.mediumText
                    .copyWith(color: AppColors.greenLight),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text('Save More',
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.greenLight)),
            ),
            Image.asset('assets/images/sing_up.png'),
            Form(
                child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'your name',
                  hintText: 'Iran Doe',
                ),
                PasswordFormField(
                  labelText: 'choose yout password',
                  hintText: '*******',
                ),
                PasswordFormField(
                  labelText: 'confirm your password',
                  hintText: '*******',
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: PrimaryButton(text: 'Sing Up'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
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
                    style:
                        AppTextStyle.smallText.copyWith(color: AppColors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;

  const CustomTextFormField({
    Key? key,
    this.padding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.textInputAction,
    this.suffixIcon,
    this.obscureText,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.green,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText!.toUpperCase(),
          labelStyle:
              AppTextStyle.inputLabelText.copyWith(color: AppColors.grey),
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
