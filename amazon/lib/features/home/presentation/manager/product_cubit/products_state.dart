part of 'products_cubit.dart';

sealed class ProductsState {}

final class ProductsInitialState extends ProductsState {}
final class ProductsLoadingState extends ProductsState {}
final class ProductsSuccessState extends ProductsState {
  final List<ProductModel>products;

  ProductsSuccessState({required this.products});
}
final class FailedToGetProductsState extends ProductsState {
  final String errMessage;

  FailedToGetProductsState({required this.errMessage});
}
final class SearchState extends ProductsState {
    final List<ProductModel>filteredProducts;

  SearchState({required this.filteredProducts});

}
