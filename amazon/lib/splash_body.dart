import 'package:amazon/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
              children: [
      Text(
        'kutuku',
        style: Styles.style20B0ld.copyWith(color: Colors.white,fontSize: 40),
      ),
      const SizedBox(
        height: 32,
      ),
      const Text(
        'Any shopping just from home',style:Styles.style16,
      ),
              ],
            ),
    );
  }
}
