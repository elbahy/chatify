import 'package:chatify/core/utils/app_color.dart';
import 'package:chatify/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/app_logo.svg',
              height: 150,
              colorFilter: const ColorFilter.mode(AppColor.kprimaryColor, BlendMode.srcIn),
            ),
            Text('Welcome Back!', style: Theme.of(context).textTheme.titleLarge),
            Text('Chatify App with Mohamed Elbahy', style: Theme.of(context).textTheme.bodyMedium),
            const LoginFormWidget()
          ],
        ),
      )),
    );
  }
}
