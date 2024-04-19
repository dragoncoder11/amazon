import 'package:amazon/features/home/data/models/product_model.dart';
import 'package:amazon/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:amazon/features/home/presentation/views/widgets/banners_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';
import 'check_box_view.dart';
import 'custom_counter_circle_avatar.dart';

class AddToCardItem extends StatelessWidget {
  const AddToCardItem({
    super.key,
    required this.model,
  });
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CheckBoxView(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .0125,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .125,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BannersImage(image: model.image!)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .35,
                          child: Text(
                            '${model.name}',
                            maxLines: 1,
                            style: Styles.style16Black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('\$${model.price}'),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                             model.price==model.oldPrice?'': '\$${model.oldPrice}',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context)
                              .addOrRemoveCart(productId: model.id.toString());
                        },
                        icon: const Icon(FontAwesomeIcons.trash))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .26,
                      height: MediaQuery.of(context).size.height * .05,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.4),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomCounterCircleAvatar(
                            icon: Icons.remove,
                          ),
                          Text(
                            '1',
                            style: Styles.style16Black,
                          ),
                          CustomCounterCircleAvatar(
                            icon: Icons.add,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${model.price}',
                      style: Styles.style16Black,
                    )
                  ],
                )
              ],
            ))
          ],
        ),
        const Divider(
          height: 40,
          thickness: .5,
        )
      ],
    );
  }
}
