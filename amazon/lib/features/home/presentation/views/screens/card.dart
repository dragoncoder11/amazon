import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/features/home/presentation/views/screens/home.dart';
import 'package:amazon/features/home/presentation/views/widgets/card_body.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Card',style: Styles.style24,),centerTitle: true,
        actions:  [IconButton(onPressed: (){}, icon:const Icon(Icons.shopping_cart))],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Home.id);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: const CardBody(),
    );
  }
}
