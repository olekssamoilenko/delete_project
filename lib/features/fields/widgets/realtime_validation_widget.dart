import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/assets.dart';
import '../../sign_in/bloc/password_validation_bloc.dart';
import '../../sign_in/widgets/validator_status_widget.dart';

class RealtimeValidationWidget extends StatefulWidget {
  const RealtimeValidationWidget({super.key});

  @override
  State<RealtimeValidationWidget> createState() => _RealtimeValidationWidget();
}

class _RealtimeValidationWidget extends State<RealtimeValidationWidget> {
  final _passwordController = TextEditingController(text: 'example@.com1');

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    context.read<PasswordValidationBloc>().add(PasswordChanged(_passwordController.text));
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordValidationBloc, PasswordValidationState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            onChanged: (value) {
              context.read<PasswordValidationBloc>().add(PasswordChanged(value));
            },
            decoration: InputDecoration(
              hintText: "Login",
              suffixIcon: IconButton(
                icon: SvgPicture.asset(
                  _obscurePassword ? hidePassword : showPassword,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const ValidationStatusWidget(
            isSubmitted: false,
          ),
          const SizedBox(height: 40),
        ],
      );
    });
  }
}
