import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/assets.dart';
import '../../sign_in/bloc/password_validation_bloc.dart';
import '../../sign_in/widgets/validator_status_widget.dart';

class PasswordInitialWidget extends StatefulWidget {
  const PasswordInitialWidget({super.key});

  @override
  State<PasswordInitialWidget> createState() => _PasswordInitialWidgetState();
}

class _PasswordInitialWidgetState extends State<PasswordInitialWidget> {
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordValidationBloc(),
      child: BlocBuilder<PasswordValidationBloc, PasswordValidationState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "Create a password",
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
        },
      ),
    );
  }
}
