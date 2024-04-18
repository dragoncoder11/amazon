import 'package:amazon/features/home/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';

import '../../../data/models/banners_model.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this.homeRepo) : super(BannersInitialState());
  final HomeRepo homeRepo;
  Future fetchBanners() async {
    try {
      emit(BannersLoadingState());
  var result = await homeRepo.fetchBanners();
  result.fold(
    (failure) =>
        emit(FailedToGetBannersState(errMessage: failure.toString())),
    (banners) => emit(
      BannersSuccessState(banners: banners),
    ),
  );
} on Exception catch (e) {
  emit(FailedToGetBannersState(errMessage: e.toString()));
}
  }
}
