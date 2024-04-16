import 'package:flutter/material.dart';

class FavouritesBody extends StatelessWidget {
  const FavouritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 3,itemBuilder: (context,index){
      return Container(height: 100,width: double.infinity,color: Colors.amber,);
    });
  }
}