import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:philips/login/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/loginPageAssets/newPhilipsLogo.jpg"),
        ],
      ),
      nextScreen: Login(),
      splashIconSize: 500,
      backgroundColor: Colors.white,
      duration: 3000,  // Duration in milliseconds (3 seconds)
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(milliseconds: 1500),
    );
  }
}
