import 'package:chatify/core/functions/navigation.dart';
import 'package:chatify/core/routing/routes_name.dart';
import 'package:chatify/core/utils/app_color.dart';
import 'package:chatify/features/auth/cubit/auth_cubit.dart';
import 'package:chatify/features/auth/cubit/auth_state.dart';
import 'package:chatify/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (prev, current) => current is LoginSuccessState || current is LoginFaildState,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          customReplacementNavigate(context, AppRoutesName.home);
        } else if (state is LoginFaildState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMsg),
            ),
          );
        }
      },
      buildWhen: (prev, current) => current is LoginLoadingState,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: state is LoginLoadingState
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
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
      },
    );
  }
}
