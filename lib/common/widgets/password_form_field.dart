import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  const PasswordFormField({
    super.key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.validator,
    this.helperText,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: widget.validator,
      obscureText: isHidden,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      helperText: widget.helperText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
        child: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
