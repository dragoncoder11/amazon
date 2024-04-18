import 'package:bloc/bloc.dart';

import '../../../data/models/categories_model.dart';
import '../../../data/repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitialState());
  
  final HomeRepo homeRepo;
  Future fetchCategories() async {
    try {
      emit(CategoriesLoadingState());
  var result = await homeRepo.fetchCategories();
  result.fold(
    (failure) =>
        emit(FailedToGetCategoriesState(errMessage: failure.toString())),
    (categories) => emit(
      CategoriesSuccessState(categories: categories),
    ),
  );
} on Exception catch (e) {
  emit(FailedToGetCategoriesState(errMessage: e.toString()));
}
  }
}

