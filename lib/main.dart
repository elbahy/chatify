import 'package:chatify/core/utils/app_color.dart';
import 'package:chatify/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Chatify());
}

class Chatify extends StatelessWidget {
  const Chatify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kGryColor, brightness: Brightness.light)),
      darkTheme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kGryColor, brightness: Brightness.dark)),
    );
  }
}
