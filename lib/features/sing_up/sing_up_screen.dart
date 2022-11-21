import 'dart:developer';

import 'package:financy_app/common/utils/uppercase_text_formatter.dart';
import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/widgets/custom_text_form_field.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

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
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: 'your name',
                    hintText: 'JOHN DOE',
                    inputFormatters: [
                      UpperCaseTextInputFormatter(),
                    ],
                    validator: Validator.validateName,
                  ),
                  CustomTextFormField(
                    labelText: 'your email',
                    hintText: 'email@email.com',
                    validator: Validator.validateEmail,
                  ),
                  PasswordFormField(
                    controller: _passwordController,
                    helperText:
                        'Must have at least 8 characters, 1 capital letter and 1 number.',
                    labelText: 'choose yout password',
                    hintText: '*******',
                    validator: Validator.validatePassword,
                  ),
                  PasswordFormField(
                    labelText: 'confirm your password',
                    hintText: '*******',
                    validator: (value) => Validator.validateConfirmPassword(
                        value!, _passwordController.text),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: PrimaryButton(
                text: 'Sing Up',
                onPressed: () {
                  final valid = _formKey.currentState != null &&
                      _formKey.currentState!.validate();
                  if (valid) {
                    log('Continuar logia de login!');
                  } else {
                    log('erro ao logar!');
                  }
                },
              ),
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
