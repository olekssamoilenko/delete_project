import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_demo/common/widgets/gradient_button.dart';
import 'package:form_demo/features/sign_in/bloc/password_validation_bloc.dart';
import 'package:form_demo/theme/assets.dart';
import 'package:form_demo/theme/theme.dart';

import '../../../common/utils/validation_utils.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/validator_status_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSubmitted = false;
  bool _obscurePassword = true;
  ValidationState _emailValidationState = ValidationState.neutral;
  ValidationState _passwordValidationState = ValidationState.neutral;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sign up',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 40),
        BlocBuilder<PasswordValidationBloc, PasswordValidationState>(
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    hintText: 'Email',
                    validationState: _emailValidationState,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: _passwordController,
                    hintText: 'Create your password',
                    obscureText: _obscurePassword,
                    isErrorTextHidden: true,
                    validationState: _passwordValidationState,
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(
                        _obscurePassword ? hidePassword : showPassword,
                        colorFilter: ColorFilter.mode(getValidationColor(validationState: _passwordValidationState), BlendMode.srcIn),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    validator: (value) {
                      if (state is PasswordInvalid) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onChanged: (password) {
                      context.read<PasswordValidationBloc>().add(PasswordChanged(password));
                    },
                  ),
                  const SizedBox(height: 20),
                  ValidationStatusWidget(
                    isSubmitted: _isSubmitted,
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: GradientButton(
                      text: 'Sign up',
                      onPressed: _onSignUpPressed,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 5,
        )
      ],
    );
  }

  void _onSignUpPressed() {
    setState(() {
      _isSubmitted = true;
      _updateValidationStates();
      //todo: refactor
      if (_emailValidationState == ValidationState.valid && _passwordValidationState == ValidationState.valid) {
        var snackBar = SnackBar(
          content: Text('Success'),
          backgroundColor: greenColor,
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  void _updateValidationStates() {
    _emailValidationState = _getEmailValidationState();
    _passwordValidationState = _getPasswordValidationState();
  }

  ValidationState _getEmailValidationState() {
    return _validateEmail() ? ValidationState.valid : ValidationState.invalid;
  }

  ValidationState _getPasswordValidationState() {
    final passwordState = context.read<PasswordValidationBloc>().state;
    return switch (passwordState) {
      PasswordValid() => ValidationState.valid,
      PasswordInvalid() => ValidationState.invalid,
      _ => ValidationState.neutral,
    };
  }

  bool _validateEmail() {
    final email = _emailController.text;
    if (email.isEmpty || !email.contains('@')) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
