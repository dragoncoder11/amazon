import 'package:flutter/material.dart';
import 'constants.dart';

class CustomSearchField extends StatelessWidget {
  CustomSearchField({
    super.key,
    required this.onChanged,
  });
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        fillColor: const Color.fromARGB(255, 247, 243, 236),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: const Icon(Icons.search),
        hintText: 'search',
      ),
      cursorColor: kPrimaryColor,
    );
  }
}
