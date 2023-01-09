import 'dart:developer';

import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/utils/uppercase_text_formatter.dart';
import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:financy_app/features/sing_up/sing_up_controller.dart';
import 'package:financy_app/features/sing_up/sing_up_state.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../services/mock_auth_service.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SingUpController>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is SingUpStateLoading) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }
        if (_controller.state is SingUpStateSuccess) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(
                  child: Text('Nova Tela!'),
                ),
              ),
            ),
          );
        }
        if (_controller.state is SingUpStateError) {
          final error = _controller.state as SingUpStateError;
          Navigator.pop(context);
          customModalBottomSheet(
            context,
            content: error.message,
            buttonText: 'Tentar novamente.',
          );
        }
      },
    );
  }

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
                    controller: _nameController,
                    labelText: 'your name',
                    hintText: 'JOHN DOE',
                    inputFormatters: [
                      UpperCaseTextInputFormatter(),
                    ],
                    validator: Validator.validateName,
                  ),
                  CustomTextFormField(
                    controller: _emailController,
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
                    _controller.singUp(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  } else {
                    log('erro ao logar!');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: MultiTextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    NamedRoute.singIn,
                  );
                },
                children: [
                  Text(
                    'Already have account? ',
                    style: AppTextStyle.smallText
                        .copyWith(color: AppColors.darkGrey),
                  ),
                  Text(
                    'Sing In',
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
