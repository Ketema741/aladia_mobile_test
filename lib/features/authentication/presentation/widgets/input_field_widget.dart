import 'package:aladia_flutter_test/core/constants/app_text_styles.dart';
import 'package:aladia_flutter_test/core/theme/app_colors.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/widgets/box_label_in.dart';
import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final Widget? prefix;

  const FormContainerWidget({
    super.key,
    this.onChanged,
    this.controller,
    this.isPasswordField,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.prefix,
  });

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  late FocusNode _focusNode;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return BoxedLabelIn(
      onChanged: widget.onChanged,
      style: const TextStyle(
        color: AppColors.blackColor,
      ),
      controller: widget.controller,
      keyboardType: widget.inputType,
      key: widget.fieldKey,
      obscureText: widget.isPasswordField == true ? _obscureText : false,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: _focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        fillColor: Theme.of(context).primaryColor.withOpacity(0.9),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 103, 103, 104), fontSize: 18),
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
          color:  Color.fromARGB(255, 85, 84, 84),
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
    );
  }
}
