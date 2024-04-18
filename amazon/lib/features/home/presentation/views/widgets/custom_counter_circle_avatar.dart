import 'package:flutter/material.dart';

class CustomCounterCircleAvatar extends StatelessWidget {
  const CustomCounterCircleAvatar({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: MediaQuery.of(context).size.width * .045,
      child: Center(child: Icon(icon)),
    );
  }
}
