import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/on_boarding_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomOnBoarding extends StatelessWidget {
  const CustomOnBoarding({
    super.key,
    required this.onBordiingModel,
  });
  final OnBardingModel onBordiingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                onBordiingModel.image,
                height: MediaQuery.of(context).size.height * .45,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 32,
          ),
          Text(
            onBordiingModel.title,
            style: Styles.style20B0ld,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            onBordiingModel.subTitle,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
