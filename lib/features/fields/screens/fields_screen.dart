import 'package:flutter/material.dart';

import '../widgets/email_fields_states_widget.dart';
import '../widgets/header_text_widget.dart';
import '../widgets/password_exceptions_states_widget.dart';
import '../widgets/password_fields_states_widget.dart';
import '../widgets/regular_text_block.dart';

class FieldsScreen extends StatefulWidget {
  const FieldsScreen({super.key});

  @override
  State<FieldsScreen> createState() => _FieldsScreenState();
}

class _FieldsScreenState extends State<FieldsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        HeaderTextWidget(),
        SizedBox(
          height: 92,
        ),
        EmailFieldStates(),
        SizedBox(
          height: 100,
        ),
        PasswordFieldStates(),
        SizedBox(
          height: 140,
        ),
        RegularTextBlock(),
        SizedBox(
          height: 80,
        ),
        PasswordExceptionsStates(),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
