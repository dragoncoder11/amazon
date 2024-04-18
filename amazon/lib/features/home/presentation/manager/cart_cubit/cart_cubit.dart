import 'package:amazon/features/home/data/models/product_model.dart';
import 'package:amazon/features/home/data/repos/home_repo_implement.dart';
import 'package:amazon/features/home/data/services/add_or_remove_from_cart_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../data/repos/home_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.homeRepo) : super(CartInitialState());
  final HomeRepo homeRepo;
AddOrRemoveFromCart addOrRemoveFromCart =AddOrRemoveFromCart(dio: Dio());
  Future fetchCarts() async {
    try {
  var result = await homeRepo.fetchCarts();
  result.fold(
    (failure) =>
        emit(FailedToGetCartState(errMessage: failure.toString())),
    (carts) => emit(
      CartSuccessState(carts: carts),
    ),
  );
} on Exception catch (e) {
  emit(FailedToGetCartState(errMessage: e.toString()));
}
  }
  Set<String> cartsId=HomeRepoImplement().cartsId ;
  Future addOrRemoveCart({required String productId})async{
 var data=await  addOrRemoveFromCart.addOrRemoveFromCart(endPoint:'carts', productId: productId);
 if(data['status']==true){
  if(cartsId.contains(productId)){
    cartsId.remove(productId);
  }else{
    cartsId.add(productId.toString());
  }
  await fetchCarts();
  emit(AddOrRemoveCartSuccessState());
 }else{
  emit(FailedToAddOrRemoveCartState());
 }

  }
}

