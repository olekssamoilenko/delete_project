import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_grid/simple_grid.dart';

import '../../../common/utils/app_utils.dart';
import '../../../theme/assets.dart';
import '../../../theme/theme.dart';

class PasswordFieldStates extends StatefulWidget {
  const PasswordFieldStates({super.key});

  @override
  State<PasswordFieldStates> createState() => _PasswordFieldStatesState();
}

class _PasswordFieldStatesState extends State<PasswordFieldStates> {
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = false;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController(text: 'Example@.com');
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility(int fieldIndex) {
    setState(() {
      if (fieldIndex == 1) {
        _obscurePassword1 = !_obscurePassword1;
      } else {
        _obscurePassword2 = !_obscurePassword2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SpGrid(
        width: MediaQuery.of(context).size.width,
        spacing: 10,
        runSpacing: 10,
        children: [
          _buildSuccessField(),
          _buildPasswordField('Password hidden', _obscurePassword1, 1),
          _buildPasswordField('Password shown', _obscurePassword2, 2),
        ],
      ),
    );
  }

  SpGridItem _buildSuccessField() {
    return buildSpGridItem(
      context,
      label: 'Success',
      child: TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(
          fillColor: greenColor.withOpacity(0.1),
          filled: true,
          focusedBorder: _buildBorder(greenColor),
          enabledBorder: _buildBorder(greenColor),
          border: _buildBorder(greenColor),
        ),
      ),
    );
  }

  SpGridItem _buildPasswordField(String label, bool obscureText, int fieldIndex) {
    return buildSpGridItem(
      context,
      label: label,
      child: TextFormField(
        controller: _passwordController,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: "Login",
          suffixIcon: IconButton(
            icon: SvgPicture.asset(
              obscureText ? hidePassword : showPassword,
            ),
            onPressed: () => _togglePasswordVisibility(fieldIndex),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(30),
    );
  }
}
