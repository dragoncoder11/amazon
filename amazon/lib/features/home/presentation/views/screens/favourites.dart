import 'package:amazon/features/home/presentation/views/screens/card.dart';
import 'package:amazon/features/home/presentation/views/widgets/favourites_body.dart';
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AddToCart.CustomAppbar(context, title: 'Favourites', icon: Icons.favorite),

      body:const FavouritesBody(),
    );
  }
}
