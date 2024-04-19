part of 'favourites_cubit.dart';

sealed class FavouritesState {}

final class FavouritesInitialState extends FavouritesState {}
final class FavouritesSuccessState extends FavouritesState {
  final List<ProductModel>favourites;

  FavouritesSuccessState({required this.favourites});
}
final class FailedToGetFavouritesState extends FavouritesState {
  final String errMessage;

  FailedToGetFavouritesState({required this.errMessage});
}
final class AddOrRemoveFavouritesSuccessState extends FavouritesState {}
final class FailedToAddOrRemoveFavouritesState extends FavouritesState {}
