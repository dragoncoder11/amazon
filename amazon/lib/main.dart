import 'package:amazon/features/home/presentation/views/screens/home.dart';
import 'package:amazon/on_boarding.dart';
import 'package:amazon/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AmazonApp());
}

class AmazonApp extends StatelessWidget {
  const AmazonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.id: (context) => Home(),
        Splash.id: (context) =>const Splash(),
        OnBoarding.id: (context) => OnBoarding(),
      },
      initialRoute: Splash.id,
    );
  }
}