import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_demo/theme/theme.dart';

import '../../../theme/assets.dart';
import '../../sign_in/bloc/password_validation_bloc.dart';
import '../../sign_in/widgets/validator_status_widget.dart';

class ClickedValidationWidget extends StatefulWidget {
  const ClickedValidationWidget({super.key});

  @override
  State<ClickedValidationWidget> createState() => _ClickedValidationWidget();
}

class _ClickedValidationWidget extends State<ClickedValidationWidget> {
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
              fillColor: redLight1,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: redLight,style: BorderStyle.solid,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: redLight,style: BorderStyle.solid,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30)),

              ),
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
            isSubmitted: true,
          ),
          const SizedBox(height: 40),
        ],
      );
    });
  }
}
