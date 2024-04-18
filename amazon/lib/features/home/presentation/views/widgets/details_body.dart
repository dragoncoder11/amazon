import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/features/home/data/models/product_model.dart';
import 'package:amazon/features/home/presentation/views/widgets/banners_image.dart';
import 'package:amazon/features/home/presentation/views/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsBody extends StatelessWidget {
  DetailsBody({super.key});
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var productDetails =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ListView(physics:const BouncingScrollPhysics(),
        children: [
          Text(
            productDetails.name.toString(),
            style: Styles.style20B0ld,
            maxLines: 3,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: productDetails.images!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .13,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BannersImage(
                              image: productDetails.images![index])),
                    );
                  })),
          const SizedBox(
            height: 20,
          ),
          CustomSmoothPageIndicator(
            controller: pageController,
            height: 16,
            count: productDetails.images!.length,
          ),
          const SizedBox(
            height: 20,
          ),
          Text('\$${productDetails.price}',style: Styles.style20B0ld,),
          const SizedBox(
            height: 15,
          ),
          Text(productDetails.desc.toString(),style: Styles.style15,),
            const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
