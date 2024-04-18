import 'package:amazon/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_to_card_item.dart';

class CardBody extends StatelessWidget {
  const CardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
      child: SafeArea(
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
           if(state is CartSuccessState){
             return ListView.builder(
                    itemCount: state.carts.length,
                    itemBuilder: (context, index) {
                      return  AddToCardItem(model: state.carts[index] ,);
                    });
           }
           if(state is FailedToGetCartState){
            return Center(child: Text(state.errMessage));
           }
           return const Text('vhvjhvhjv');
          },
        ),
      ),
    );
  }
}
