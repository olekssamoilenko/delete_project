import 'package:flutter/material.dart';

import '../../features/sign_in/screens/sign_in_screen.dart';
import '../../theme/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mainBg),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: SignInScreen(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
