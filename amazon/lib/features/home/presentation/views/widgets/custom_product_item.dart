import 'package:amazon/features/home/data/models/product_model.dart';
import 'package:amazon/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/favourites_cubit/favourites_cubit.dart';
import 'banners_image.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * .22,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    BannersImage(image: productModel.image!),
                    Container(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .08,
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(15))),
                      child: Center(
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              BlocProvider.of<CartCubit>(context).addOrRemoveCart(productId: productModel.id.toString());
                            },
                            icon:  Icon(BlocProvider.of<CartCubit>(context).cartsId.contains(productModel.id.toString()) ?Icons.check:Icons.add)),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * .025,
                      right: MediaQuery.of(context).size.width * .025,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * .021,
                        backgroundColor: Colors.grey,
                        child: SizedBox(
                          height: 28,
                          width: 28,
                          child: Stack(
                            children: [
                              const Center(
                                child: Icon(
                                  Icons.favorite,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              Center(
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                       BlocProvider.of<FavouritesCubit>(context).addOrRemoveFavourite(productId: productModel.id.toString());
                                    },
                                    icon:  Icon(
                                      size: 25,
                                      Icons.favorite,
                                      color:  BlocProvider.of<FavouritesCubit>(context).favouritesId.contains(productModel.id.toString())?Colors.red: Colors.grey,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
        const SizedBox(
          height: 5,
        ),
        Text(
          productModel.name! ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Styles.style18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${productModel.price}',
              style: Styles.style15,
            ),
            Text(
             productModel.oldPrice==productModel.price?'' :'\$${productModel.oldPrice}',
              style: Styles.style15.copyWith(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
