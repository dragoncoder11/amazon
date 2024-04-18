import 'package:amazon/features/home/presentation/views/screens/card.dart';
import 'package:amazon/features/home/presentation/views/widgets/details_body.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});
static String id='details';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AddToCart.CustomAppbar(context, title: 'Product Details', ),
      body: DetailsBody(),

    );
  }
}