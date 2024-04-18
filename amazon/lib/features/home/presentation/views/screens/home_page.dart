import 'package:amazon/core/utils/constants.dart';
import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/features/home/presentation/views/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/ku.png',
            height: 40,
            width: 40,
          ),
        ),
        backgroundColor: kPrimaryColor,
        title: Text(
          'Kutuku',
          style: Styles.style20B0ld.copyWith(color: Colors.white),
        ),
      ),
      body: HomePageBody(),
    );
  }
}
