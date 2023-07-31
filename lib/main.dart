import 'package:flutter/material.dart';
import 'package:globelink/core/theme/theme_data.dart';
import 'package:globelink/core/utils/functions/hide_system_ui.dart';
import 'package:globelink/features/auth/presentation/views/auth_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  hideSystemUI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kLightThemeData,
      home: const AuthView(),
    );
  }
}
