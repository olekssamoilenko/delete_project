import 'package:flutter/material.dart';
import 'package:form_demo/theme/theme.dart';

import '../../features/fields/screens/fields_screen.dart';

class HomePageWeb extends StatelessWidget {
  const HomePageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Clario Form Fields'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: FieldsScreen(),
          ),
        ),
      ),
    );
  }
}
