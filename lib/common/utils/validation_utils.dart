import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../features/sign_in/bloc/password_validation_bloc.dart';
import '../../theme/theme.dart';

// color validation states
enum ValidationState {
  valid,
  invalid,
  neutral,
}

//determine validation status for color states
Color getValidationColor({required ValidationState validationState, bool isFocused = false}) {
  if (!isFocused && validationState == ValidationState.neutral) {
    return lightGreyColor1;
  }

  switch (validationState) {
    case ValidationState.valid:
      return greenColor;
    case ValidationState.invalid:
      return redLight;
    case ValidationState.neutral:
    default:
      return lightGreyColor1;
  }
}

//determine validation  text color

Color getValidationTextColor({
  required ValidationState validationState,
  bool isFocused = false,
}) {
  switch (validationState) {
    case ValidationState.neutral:
      return isFocused ? darkColor1 : lightGreyColor1;
    case ValidationState.valid:
      return greenColor;
    case ValidationState.invalid:
      return redLight;
    default:
      return darkColor1;
  }
}

//validation status model
class ValidationStatus extends Equatable {
  final bool hasMinLength;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasDigit;
  final bool hasNoSpaces;

  const ValidationStatus({
    required this.hasMinLength,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasDigit,
    required this.hasNoSpaces,
  });

  ValidationStatus copyWith({
    bool? hasMinLength,
    bool? hasUppercase,
    bool? hasLowercase,
    bool? hasDigit,
    bool? hasNoSpaces,
  }) {
    return ValidationStatus(
      hasMinLength: hasMinLength ?? this.hasMinLength,
      hasUppercase: hasUppercase ?? this.hasUppercase,
      hasLowercase: hasLowercase ?? this.hasLowercase,
      hasDigit: hasDigit ?? this.hasDigit,
      hasNoSpaces: hasNoSpaces ?? this.hasNoSpaces,
    );
  }

  @override
  List<Object?> get props => [
        hasMinLength,
        hasUppercase,
        hasLowercase,
        hasDigit,
        hasNoSpaces,
      ];
}

//define validation rules
ValidationStatus setValidationStatus(String password) {
  return ValidationStatus(
    hasMinLength: password.length >= 8,
    hasUppercase: password.contains(RegExp(r'[A-Z]')),
    hasLowercase: password.contains(RegExp(r'[a-z]')),
    hasDigit: password.contains(RegExp(r'[0-9]')),
    hasNoSpaces: !password.contains(' '),
  );
}

//determine validation status for error color states
ValidationStatus determineValidationStatus(PasswordValidationState state) {
  if (state is PasswordValid) {
    return const ValidationStatus(
      hasMinLength: true,
      hasUppercase: true,
      hasLowercase: true,
      hasDigit: true,
      hasNoSpaces: true,
    );
  } else if (state is PasswordInvalid) {
    return state.status;
  } else {
    return const ValidationStatus(
      hasMinLength: false,
      hasUppercase: false,
      hasLowercase: false,
      hasDigit: false,
      hasNoSpaces: false,
    );
  }
}


Color setTextValidationColor({
  required bool isValid,
  required bool isSubmitted,
}) {
  if (!isSubmitted) {
    return isValid ? greenColor : darkColor1;
  }

  return isValid ? greenColor : redLight;
}
