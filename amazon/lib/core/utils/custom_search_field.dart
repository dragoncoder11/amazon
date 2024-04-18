
import 'package:amazon/features/home/data/models/product_model.dart';
import 'package:amazon/features/home/data/repos/home_repo_implement.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CustomSearchField extends StatelessWidget {
   CustomSearchField({
    super.key, required this.onChanged,
  });
  final Function(String)onChanged;
  @override
   List<ProductModel> filteredProducts=[];
  void filter({required String char}){
    filteredProducts=homeRepoImplement.products.where((element) => element.name!.toLowerCase().startsWith(char.toLowerCase())).toList();
  }
  HomeRepoImplement homeRepoImplement=HomeRepoImplement();
  Widget build(BuildContext context) {
    return TextField(
      onChanged:onChanged,
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
