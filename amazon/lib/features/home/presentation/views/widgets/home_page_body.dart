import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
      child: ListView(
        children: [
          Text('home')
        ],
      ),
    ));
  }
}