import 'package:flutter/material.dart';

class CheckBoxView extends StatefulWidget {
   CheckBoxView({super.key});

  @override
  State<CheckBoxView> createState() => _CheckBoxViewState();
}

class _CheckBoxViewState extends State<CheckBoxView> {
bool isSelected=false;

  @override
  Widget build(BuildContext context) {
    return  Checkbox(value: isSelected,onChanged: (value) {
      setState(() {
        isSelected=value!;
      });
    },);
  }
}