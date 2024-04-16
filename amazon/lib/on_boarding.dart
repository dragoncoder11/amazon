import 'package:amazon/core/utils/constants.dart';
import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/features/auth/presentation/views/screens/login.dart';
import 'package:amazon/features/auth/presentation/views/screens/sign_up.dart';
import 'package:amazon/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'core/utils/custom_button.dart';
import 'custom_on_boarding.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  static String id = 'OnBoarding';
  static final controller = PageController();
  final List<OnBardingModel> onBoardingList = [
    OnBardingModel(
        image: 'assets/s1.jpg',
        title: 'Find any accessories you want',
        subTitle: 'Find any thing you want'),
    OnBardingModel(
        image: 'assets/s2.jpg',
        title: 'Find any clothes you want',
        subTitle: 'Find any thing you want'),
    OnBardingModel(
        image: 'assets/s3.jpg',
        title: 'Find any thing you want',
        subTitle: 'Find any thing you want'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: controller,
              itemCount: onBoardingList.length,
              itemBuilder: (context, index) {
                return CustomOnBoarding(
                  onBordiingModel: onBoardingList[index],
                );
              }),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .26,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                  effect: const WormEffect(
                    dotHeight: 7,
                    spacing: 5,
                    activeDotColor: kPrimaryColor,
                    dotColor: Colors.grey,
                  ),
                  controller: OnBoarding.controller,
                  count: 3),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .16,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(SignUp.id);
                },
                title: 'Create Account',
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .10,
            left: 0,
            right: 0,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(Login.id);
                  },
                  child: Text(
                    'Already Have An Account',
                    style: Styles.style16.copyWith(color: kPrimaryColor),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
