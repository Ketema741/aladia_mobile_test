import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.labelText, 
    this.prefix, 
    this.suffix,  
    this.isPasswordField = false,
  });

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final Widget? prefix;
  final Widget? suffix;
  final bool isPasswordField;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
           fontSize: 18,
           ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          prefix: widget.prefix,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.50,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false
                        ? const Color.fromARGB(255, 85, 84, 84)
                        : const Color.fromARGB(255, 85, 84, 84),
                    size: 28,
                  )
                : const Text(""),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
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
      hintText: 'Enter your text',
  );
}

@widgetbook.UseCase(
  name: 'Email',
  type: CustomTextField,
)
CustomTextField emailTextCustomTextField(BuildContext context) {
  return CustomTextField(
    controller: TextEditingController(),
    hintText: 'Email',
  );
}


@widgetbook.UseCase(
  name: 'Passowrd',
  type: CustomTextField,
)
CustomTextField passwordTextCustomTextField(BuildContext context) {
  return CustomTextField(
    controller: TextEditingController(),
    hintText: 'Password',
    isPasswordField:true,

  );
}

@widgetbook.UseCase(
  name: 'ConfirmPassowrd',
  type: CustomTextField,
)
CustomTextField confirmPasswordTextCustomTextField(BuildContext context) {
  return CustomTextField(
    controller: TextEditingController(),
    hintText: 'Confirm Password',
    isPasswordField:true,
  );
}

@widgetbook.UseCase(
  name: 'firstName',
  type: CustomTextField,
)
CustomTextField nameTextCustomTextField(BuildContext context) {
  return CustomTextField(
    controller: TextEditingController(),
    hintText: 'First Name',
  );
}

