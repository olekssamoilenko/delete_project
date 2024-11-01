import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_demo/theme/theme.dart';

import 'common/pages/home_page.dart';
import 'common/pages/home_page_web.dart';
import 'common/widgets/global_bloc_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final applicationTheme = ApplicationTheme();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: applicationTheme.lightTheme,
      home: const GlobalBlocProvider(
        child: kIsWeb ? HomePageWeb() : HomePage(),
      ),
    );
  }
}
