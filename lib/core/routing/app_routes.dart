import 'package:chatify/core/routing/routes_name.dart';
import 'package:chatify/features/auth/cubit/auth_cubit.dart';
import 'package:chatify/features/auth/presentation/views/login_view.dart';
import 'package:chatify/features/home/presentation/views/home_view.dart';
import 'package:chatify/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutesName.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: AppRoutesName.login,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: AppRoutesName.splash,
      builder: (context, state) => const SplashView(),
    ),
  ],
);
