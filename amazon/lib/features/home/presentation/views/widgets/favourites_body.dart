import 'package:amazon/features/home/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_favourite_item.dart';

class FavouritesBody extends StatelessWidget {
  const FavouritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: BlocBuilder<FavouritesCubit, FavouritesState>(
            builder: (context, state) {
              if(state is FavouritesSuccessState){
                return ListView.builder(
                  itemCount: state.favourites.length,
                  itemBuilder: (context, index) {
                    return CustomFavouriteItem(productModel: state.favourites[index],);
                  });
              }
              if(state is FailedToGetFavouritesState){
                return Text(state.errMessage);
              }
              return const Center(child: CircularProgressIndicator(),);
            },
          ),
        ),
      ],
    );
  }
}
