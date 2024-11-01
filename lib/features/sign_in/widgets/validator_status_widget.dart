import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_demo/features/sign_in/bloc/password_validation_bloc.dart';
import 'package:form_demo/features/sign_in/widgets/validation_status_text.dart';

import '../../../common/utils/validation_utils.dart';
import '../models/validation_item_model.dart';

class ValidationStatusWidget extends StatelessWidget {
  final bool isSubmitted; //check if submit button is pressed

  const ValidationStatusWidget({super.key, this.isSubmitted = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordValidationBloc, PasswordValidationState>(
      builder: (context, state) {
        final status = determineValidationStatus(state);

        final validationItems = [
          ValidationItem(
            isValid: status.hasMinLength && status.hasNoSpaces,
            text: '8 characters or more (no spaces)',
          ),
          ValidationItem(
            isValid: status.hasUppercase,
            text: 'Uppercase and lowercase letters',
          ),
          ValidationItem(
            isValid: status.hasDigit,
            text: 'At least one digit',
          ),
        ];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: validationItems
                .map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ValidationStatusText(
                        isValid: item.isValid,
                        text: item.text,
                        isSubmitted: isSubmitted,
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
