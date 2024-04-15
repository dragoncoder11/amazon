import 'package:amazon/core/utils/constants.dart';
import 'package:amazon/features/home/presentation/views/screens/home.dart';
import 'package:amazon/on_boarding.dart';
import 'package:amazon/splash_body.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static String id = 'splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(OnBoarding.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: kPrimaryColor,
    body: SplashBody());
  }
}
