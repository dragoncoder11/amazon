import 'package:amazon/features/home/data/services/add_or_remove_from_favourites.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repos/home_repo.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this.homeRepo) : super(FavouritesInitialState());


  final HomeRepo homeRepo;
  AddOrRemoveFromFavourites addOrRemoveFromFavourites = AddOrRemoveFromFavourites(dio: Dio());
  Set<String> favouritesId = {};

  Future<void> fetchFavourites() async {
    try {
      var result = await homeRepo.fetchFavourites();
      result.fold(
        (failure) => emit(FailedToGetFavouritesState(errMessage: failure.toString())),
        (favourites) {
          emit(FavouritesSuccessState(favourites: favourites));
          updateFavouritesId(favourites);
        },
      );
    } catch (e) {
      emit(FailedToGetFavouritesState(errMessage: e.toString()));
    }
  }
  
  void updateFavouritesId(List<ProductModel>favourites ) {
    favouritesId = favourites.map((product) => product.id.toString()).toSet();
  }

  Future<void> addOrRemoveFavourite({required String productId}) async {
    try {
      var data = await addOrRemoveFromFavourites.addOrRemoveFromFavourites(
        endPoint:'favorites',
        productId: productId,
      );
      if (data['status'] == true) {
        if (favouritesId.contains(productId)) {
          favouritesId.remove(productId);
        } else {
          favouritesId.add(productId);
        }
         fetchFavourites();
        emit(AddOrRemoveFavouritesSuccessState());
      } else {
        emit(FailedToAddOrRemoveFavouritesState());
      }
    } catch (e) {
      emit(FailedToAddOrRemoveFavouritesState());
    }
  }
}
