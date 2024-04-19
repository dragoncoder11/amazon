import 'package:amazon/features/home/data/models/product_model.dart';
import 'package:amazon/features/home/data/services/add_or_remove_from_cart_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../data/repos/home_repo.dart';

part 'cart_state.dart';
class CartCubit extends Cubit<CartState> {
  CartCubit(this.homeRepo) : super(CartInitialState());

  final HomeRepo homeRepo;
  AddOrRemoveFromCart addOrRemoveFromCart = AddOrRemoveFromCart(dio: Dio());
  Set<String> cartsId = {};

  Future<void> fetchCarts() async {
    try {
      var result = await homeRepo.fetchCarts();
      result.fold(
        (failure) => emit(FailedToGetCartState(errMessage: failure.toString())),
        (carts) {
          emit(CartSuccessState(carts: carts));
          updateCartsId(carts);
        },
      );
    } catch (e) {
      emit(FailedToGetCartState(errMessage: e.toString()));
    }
  }

  void updateCartsId(List<ProductModel> carts) {
    cartsId = carts.map((product) => product.id.toString()).toSet();
  }

  Future<void> addOrRemoveCart({required String productId}) async {
    try {
      var data = await addOrRemoveFromCart.addOrRemoveFromCart(
        endPoint: 'carts',
        productId: productId,
      );
      if (data['status'] == true) {
        if (cartsId.contains(productId)) {
          cartsId.remove(productId);
        } else {
          cartsId.add(productId);
        }
         fetchCarts();
        emit(AddOrRemoveCartSuccessState());
      } else {
        emit(FailedToAddOrRemoveCartState());
      }
    } catch (e) {
      emit(FailedToAddOrRemoveCartState());
    }
  }
}