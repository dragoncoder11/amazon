import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/features/home/presentation/views/screens/home.dart';
import 'package:amazon/features/home/presentation/views/widgets/card_body.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context, title: 'My Cart',icon:Icons.shopping_cart ),
      body: const CardBody(),
    );
  }

  static AppBar CustomAppbar(BuildContext context,{required String title, IconData? icon}) {
    return AppBar(backgroundColor: Colors.transparent,
      title:  Text(title,style: Styles.style24,),centerTitle: true,
      actions:  [IconButton(onPressed: (){}, icon: Icon(icon))],
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Home.id);
          },
          icon: const Icon(Icons.arrow_back_ios)),
    );
  }
}
