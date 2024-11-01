import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';

import '../../../common/utils/app_utils.dart';
import '../../../theme/theme.dart';

class EmailFieldStates extends StatefulWidget {
  const EmailFieldStates({super.key});

  @override
  State<EmailFieldStates> createState() => _EmailFieldStatesState();
}

class _EmailFieldStatesState extends State<EmailFieldStates> {
  late final FocusNode _focusNode;
  late final TextEditingController _emailController;
  final _isError = ValueNotifier<bool>(false);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..requestFocus();
    _emailController = TextEditingController(text: 'Example.com');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formKey.currentState?.validate();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _isError.dispose();
    _emailController.dispose();
    super.dispose();
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
          buildSpGridItem(
            context,
            label: 'Initial',
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Login"),
            ),
          ),
          buildSpGridItem(
            context,
            label: 'Focused',
            child: TextFormField(
              focusNode: _focusNode,
              decoration: const InputDecoration(hintText: "Login"),
            ),
          ),
          buildSpGridItem(
            context,
            label: 'Error',
            child: ValueListenableBuilder<bool>(
              valueListenable: _isError,
              builder: (context, isError, _) {
                return TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    fillColor: isError ? redLight1 : whiteColor,
                    filled: true,
                  ),
                  validator: _validateEmail,
                );
              },
            ),
          ),
          buildSpGridItem(
            context,
            label: 'Disabled',
            child: TextFormField(
              enabled: false,
              decoration: const InputDecoration(hintText: "Login"),
            ),
          ),
        ],
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      _isError.value = true;
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      _isError.value = true;
      return 'Please enter a valid email';
    }
    _isError.value = false;
    return null;
  }
}
