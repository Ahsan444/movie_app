import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/Constants/constants.dart';
import '../BottomNavigation/bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    moveToDashBoard(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.9),
      body: Center(
        child: Lottie.asset(
          Constants.SPLASH_ANIM,
          controller: controller,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..forward();
          },
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  void moveToDashBoard(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (_) => const BottomNavScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
