import 'package:chatify/core/routing/app_routes.dart';
import 'package:chatify/core/utils/app_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Chatify());
}

class Chatify extends StatelessWidget {
  const Chatify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      themeMode: ThemeMode.dark,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kGryColor, brightness: Brightness.light)),
      darkTheme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kGryColor, brightness: Brightness.dark)),
    );
  }
}
