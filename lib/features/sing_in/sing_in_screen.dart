import 'dart:developer';

import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:financy_app/features/sing_in/sing_in_state.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/constants/routes.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../services/mock_auth_service.dart';
import 'sing_in_controller.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SingInController>();

  @override
  void dispose() {
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
        if (_controller.state is SingInStateLoading) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }
        if (_controller.state is SingInStateSuccess) {
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
        if (_controller.state is SingInStateError) {
          final error = _controller.state as SingInStateError;
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
              padding: const EdgeInsets.only(top: 120.0, bottom: 12.0),
              child: Text(
                'Welcome Back!',
                style: AppTextStyle.mediumText
                    .copyWith(color: AppColors.greenLight),
              ),
            ),
            Image.asset('assets/images/sing_in.png'),
            Form(
              key: _formKey,
              child: Column(
                children: [
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
                    labelText: 'your password',
                    hintText: '*******',
                    validator: Validator.validatePassword,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: PrimaryButton(
                text: 'Sing In',
                onPressed: () {
                  final valid = _formKey.currentState != null &&
                      _formKey.currentState!.validate();
                  if (valid) {
                    _controller.singIn(
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
                  Navigator.popAndPushNamed(
                    context,
                    NamedRoute.signUp,
                  );
                },
                children: [
                  Text(
                    'Don\'t Have Account? ',
                    style: AppTextStyle.smallText
                        .copyWith(color: AppColors.darkGrey),
                  ),
                  Text(
                    'Sing Up',
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
