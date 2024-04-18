part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitialState extends CartState {}
final class CartSuccessState extends CartState {
  final List<ProductModel>carts;

  CartSuccessState({required this.carts});
}
final class FailedToGetCartState extends CartState {
  final String errMessage;

  FailedToGetCartState({required this.errMessage});
}
final class AddOrRemoveCartSuccessState extends CartState {}
final class FailedToAddOrRemoveCartState extends CartState {}

