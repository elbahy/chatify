import 'package:chatify/core/utils/app_color.dart';
import 'package:chatify/features/auth/cubit/auth_cubit.dart';
import 'package:chatify/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email',
            icon: Iconsax.direct,
          ),
          CustomTextFormField(
            controller: passController,
            keyboardType: TextInputType.visiblePassword,
            labelText: 'Password',
            icon: Iconsax.password_check,
            isPass: true,
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: const Text('Forget Password?'),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                AuthCubit.get(context).emailAddress = emailController.text;
                AuthCubit.get(context).password = passController.text;
                AuthCubit.get(context).login();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.kprimaryColor,
              foregroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.all(16),
            ),
            child: Center(
              child: Text('Login'.toUpperCase()),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onBackground,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(16),
            ),
            child: Center(
              child: Text('Create Account'.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
