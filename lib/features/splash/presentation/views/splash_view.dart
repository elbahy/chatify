import 'package:chatify/core/functions/navigation.dart';
import 'package:chatify/core/routing/routes_name.dart';
import 'package:chatify/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  AnimationController? _controller;

  Animation<double>? _animation;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      customReplacementNavigate(context, AppRoutesName.login);
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // تحديد مدة الانتقال
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInQuad,
    );

    _controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation!,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/app_logo.svg',
                fit: BoxFit.cover,
                height: 150,
                width: 150,
                colorFilter: const ColorFilter.mode(
                  AppColor.kprimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 20),
              const Text('Chatify !', style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
