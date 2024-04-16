import 'package:amazon/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.title});
  final Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
        backgroundColor: const MaterialStatePropertyAll(kPrimaryColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
      ),
      onPressed: onTap,
      child:  Text(
        title,
        style:const TextStyle(color: Colors.white),
      ),
    );
  }
}
