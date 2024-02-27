import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const SplashScreen());

class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              fit: BoxFit.contain,
              width: 150,
              onLoaded: (composition) {},
            ),
          ),
        ],
      )),
    );
  }
}
