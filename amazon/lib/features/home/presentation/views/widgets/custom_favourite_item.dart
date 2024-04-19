
import 'package:amazon/core/utils/constants.dart';
import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/features/home/data/models/product_model.dart';
import 'package:amazon/features/home/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'banners_image.dart';

class CustomFavouriteItem extends StatelessWidget {
  const CustomFavouriteItem({
    super.key, required this.productModel,
  });
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * .18,
        width: double.infinity,
        decoration: BoxDecoration(
            color:const Color.fromARGB(255, 227, 219, 219),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .18,
              width: MediaQuery.of(context).size.width * .36,
              child: ClipRRect(
                  borderRadius:const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: BannersImage(
                      image:
                        productModel.image!  )),
            ),
            Expanded(
              child: Padding(
                padding:const  EdgeInsets.symmetric(
                    horizontal: 15, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.name!,
                      maxLines: 1,
                      style: Styles.style18,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${productModel.price}',style: Styles.style16Black,),
                        Text(
                         productModel.oldPrice==productModel.price?'':'\$${productModel.oldPrice}',
                          style: Styles.style16Black.copyWith(decoration: TextDecoration.lineThrough)
                        ),
                      ],
                    ),
                     const SizedBox(
                      height: 18,
                    ),
                    Align(alignment: Alignment.bottomCenter,child: ElevatedButton(onPressed: (){
                   BlocProvider.of<FavouritesCubit>(context).addOrRemoveFavourite(productId: productModel.id.toString());
                    },style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(kPrimaryColor)), child:const Text('remove',style: Styles.style16,),))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}









