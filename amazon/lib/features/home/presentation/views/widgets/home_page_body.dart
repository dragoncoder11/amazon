import 'package:amazon/core/utils/constants.dart';
import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:amazon/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:amazon/features/home/presentation/manager/product_cubit/products_cubit.dart';
import 'package:amazon/features/home/presentation/views/screens/details.dart';
import 'package:amazon/features/home/presentation/views/widgets/add_to_card_item.dart';
import 'package:amazon/features/home/presentation/views/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/custom_search_field.dart';
import 'banners_image.dart';
import 'custom_category_item.dart';
import 'custom_smooth_page_indicator.dart';

class HomePageBody extends StatefulWidget {
  HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final controller = PageController();

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Column(
        children: [
           CustomSearchField(onChanged: (char) {
             BlocProvider.of<ProductsCubit>(context).filter(char: char);
           },),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: BlocBuilder<BannersCubit, BannersState>(
                    builder: (context, state) {
                      if (state is BannersLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is FailedToGetBannersState) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  backgroundColor: Colors.blue,
                                  content: Text(state.errMessage ?? 'error'),
                                ));
                      }
                      if (state is BannersSuccessState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .2,
                          child: PageView.builder(
                              controller: controller,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return BannersImage(
                                    image: state.banners[index].image!);
                              }),
                        );
                      }
                      return const Text('data');
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomSmoothPageIndicator(
                    controller: controller,
                    height: 16, count: 3,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const SliverToBoxAdapter(
                    child: Text(
                  'Select Category',
                  style: Styles.style20B0ld,
                )),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 12,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .06,
                    child: BlocBuilder<CategoriesCubit, CategoriesState>(
                      builder: (context, state) {
                        if (state is FailedToGetCategoriesState) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: Colors.blue,
                                    content: Text(state.errMessage ?? 'error'),
                                  ));
                        }
                        if (state is CategoriesSuccessState) {
                          return ListView.builder(
                              itemCount: 5,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedItem = index;
                                    });
                                  },
                                  child: CustomCategoryItem(
                                    color: selectedItem == index
                                        ? kPrimaryColor
                                        : Colors.grey,
                                    name: state.categories[index].name!,
                                  ),
                                );
                              });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                 const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                 SliverFillRemaining(
                  child: BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                         if (state is FailedToGetProductsState) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: Colors.blue,
                                    content: Text(state.errMessage ?? 'error'),
                                  ));
                        }
                      if(state is ProductsSuccessState){
                        return GridView.builder(itemCount: BlocProvider.of<ProductsCubit>(context).filteredProducts.isEmpty?state.products.length:BlocProvider.of<ProductsCubit>(context).filteredProducts.length,
                                      physics:const BouncingScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 15,
                                                childAspectRatio: 3 / 4.3),
                                        itemBuilder: (context,index){
                                          return GestureDetector(onTap: () {
                                            Navigator.of(context).pushNamed(Details.id,arguments:state.products[index] );
                                          },child: CustomProductItem(productModel: BlocProvider.of<ProductsCubit>(context).filteredProducts.isEmpty?state.products[index]:BlocProvider.of<ProductsCubit>(context).filteredProducts[index],));
                                        });
                      }
                                         return const Center(
                          child: CircularProgressIndicator(),
                        );
                    },
                  ),
                ), 
             
              ],
            ),
          )
        ],
      ),
    ));
  }
}
