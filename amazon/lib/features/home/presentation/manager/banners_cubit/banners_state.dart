part of 'banners_cubit.dart';

sealed class BannersState {}

final class BannersInitialState extends BannersState {}
final class BannersLoadingState extends BannersState {}
final class BannersSuccessState extends BannersState {
  final List<BannersModel>banners;

  BannersSuccessState({required this.banners});
}
final class FailedToGetBannersState extends BannersState {
  final String errMessage;

  FailedToGetBannersState({required this.errMessage});
}
