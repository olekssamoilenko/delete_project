import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../common/utils/validation_utils.dart';
import '../../../theme/theme.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isErrorTextHidden;
  final ValidationState validationState;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.isErrorTextHidden = false,
    this.validationState = ValidationState.neutral,
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  bool _isFocused = false;//check

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('_focusNode.hasFocus>> ${_focusNode.hasFocus}');
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: getValidationTextColor(validationState: widget.validationState, isFocused: _isFocused)),
        suffixIcon: widget.suffixIcon,
        fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
          return widget.validationState == ValidationState.invalid ? redLight1 : whiteColor;
        }),
        errorStyle: TextStyle(fontSize: widget.isErrorTextHidden ? 0 : 13, color: redLight),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: getValidationColor(validationState: widget.validationState)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: getValidationColor(validationState: widget.validationState)),
        ),
      ),
      style: TextStyle(
        color: getValidationTextColor(validationState: widget.validationState, isFocused: _isFocused),
      ),
      cursorColor: darkColor1,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
