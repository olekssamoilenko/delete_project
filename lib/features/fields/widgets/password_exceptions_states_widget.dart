import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_demo/features/fields/widgets/password_initial_widget.dart';
import 'package:form_demo/features/fields/widgets/realtime_validation_widget.dart';
import 'package:simple_grid/simple_grid.dart';

import '../../../common/utils/app_utils.dart';
import '../../sign_in/bloc/password_validation_bloc.dart';
import 'clicked_validation_widget.dart';

class PasswordExceptionsStates extends StatefulWidget {
  const PasswordExceptionsStates({
    super.key,
  });

  @override
  State<PasswordExceptionsStates> createState() => _PasswordExceptionsStates();
}

class _PasswordExceptionsStates extends State<PasswordExceptionsStates> {
  final _passwordController = TextEditingController(text: 'example@.com ');

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SpGrid(
        width: MediaQuery.of(context).size.width,
        spacing: 10,
        runSpacing: 10,
        children: [
          buildSpGridItem(
            context,
            label: 'Password initial',
            child: const PasswordInitialWidget(),
          ),
          buildSpGridItem(
            context,
            label: 'Real-time validation',
            child: BlocProvider(
              create: (context) => PasswordValidationBloc(),
              child: const RealtimeValidationWidget(),
            ),
          ),
          buildSpGridItem(
            context,
            label: 'User clicked on CTA',
            child: const ClickedValidationWidget(),
          ),
        ],
      ),
    );
  }
}
