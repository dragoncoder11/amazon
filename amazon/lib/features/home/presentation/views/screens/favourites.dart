import 'package:amazon/features/home/presentation/views/widgets/favourites_body.dart';
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavouritesBody(),
    );
  }
}
