import 'package:chatify/core/utils/app_color.dart';
import 'package:chatify/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
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
            CustomTextFormField(
              controller: emailController,
              labeText: 'Email',
              icon: Iconsax.direct,
            ),
            CustomTextFormField(
              controller: passController,
              labeText: 'Password',
              icon: Iconsax.password_check,
              isPass: true,
            )
          ],
        ),
      )),
    );
  }
}
