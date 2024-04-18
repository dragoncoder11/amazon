import 'package:bloc/bloc.dart';

import '../../../data/models/product_model.dart';
import '../../../data/repos/home_repo.dart';
import '../../../data/repos/home_repo_implement.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitialState());
  HomeRepoImplement homeRepoImplement=HomeRepoImplement();


final HomeRepo homeRepo;
  Future fetchProducts() async {
    try {
      emit(ProductsLoadingState());
  var result = await homeRepo.fetchProducts();
  result.fold(
    (failure) =>
        emit(FailedToGetProductsState(errMessage: failure.toString())),
    (products) => emit(
      ProductsSuccessState(products: products),
    ),
  );
} on Exception catch (e) {
  emit(FailedToGetProductsState(errMessage: e.toString()));
}
  }
  List<ProductModel> filteredProducts=[];
  void filter({required String char}){
    filteredProducts=homeRepoImplement.products.where((element) => element.name!.toLowerCase().startsWith(char.toLowerCase())).toList();
    emit(SearchState(filteredProducts: filteredProducts));
  }
}

