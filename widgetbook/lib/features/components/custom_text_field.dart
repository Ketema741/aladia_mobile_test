import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText = '',
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Default Style',
  type: CustomTextField,
)
CustomTextField defaultCustomTextField(BuildContext context) {
  return CustomTextField(
    controller: TextEditingController(),
  );
}

@widgetbook.UseCase(
  name: 'With Hint Text',
  type: CustomTextField,
)
CustomTextField hintTextCustomTextField(BuildContext context) {
  return CustomTextField(
    controller: TextEditingController(),
    hintText: 'Email',
  );
}


@widgetbook.UseCase(
  name: 'With Hint Text',
  type: CustomTextField,
)
CustomTextField passwordTextCustomTextField(BuildContext context) {
  return CustomTextField(
    controller: TextEditingController(),
    hintText: 'Email',
  );
}