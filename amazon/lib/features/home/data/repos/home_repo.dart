import 'package:amazon/features/home/data/models/banners_model.dart';
import 'package:amazon/features/home/data/models/categories_model.dart';
import 'package:amazon/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
   Future<Either<Error,List<BannersModel>>>fetchBanners();
     Future<Either<Error,List<CategoriesModel>>>fetchCategories();
   Future<Either<Error,List<ProductModel>>>fetchProducts();
      Future<Either<Error,List<ProductModel>>>fetchCarts();


}