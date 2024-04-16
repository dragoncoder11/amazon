import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.type,
    this.icon,
    this.onPressed,  this.obscureText=false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final TextInputType? type;
  final Function()? onPressed;
  final IconData? icon;
  final bool obscureText;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$hint is required';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hint,
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(icon),
            ),
          ),
          keyboardType: type,
          obscureText: obscureText,
        ),
      ),
    );
  }
}