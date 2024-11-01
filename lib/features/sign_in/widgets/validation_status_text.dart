import 'package:flutter/material.dart';
import 'package:form_demo/common/utils/validation_utils.dart';

class ValidationStatusText extends StatelessWidget {
  final bool isValid;
  final String text;
  final bool isSubmitted;

  const ValidationStatusText({
    super.key,
    required this.isValid,
    required this.text,
    this.isSubmitted = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = setTextValidationColor(isSubmitted: isSubmitted, isValid: isValid);
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: color,
          ),
    );
  }
}
