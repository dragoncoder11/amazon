
import 'package:amazon/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key, required this.name, required this.color,
  });
final String name;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: AnimatedContainer(
        duration:const Duration(microseconds: 300),
        height:MediaQuery.of(context).size.height*.06,
        width: MediaQuery.of(context).size.width*.38,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(child: Text(name,style: Styles.style16,)),
      ),
    );
  }
}
