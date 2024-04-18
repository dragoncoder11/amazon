import 'package:amazon/features/home/data/models/banners_model.dart';
import 'package:amazon/features/home/data/models/categories_model.dart';
import 'package:amazon/features/home/data/models/product_model.dart';
import 'package:amazon/features/home/data/repos/home_repo.dart';
import 'package:amazon/features/home/data/services/add_to_card_service.dart';
import 'package:amazon/features/home/data/services/banners_service.dart';
import 'package:amazon/features/home/data/services/categories_service.dart';
import 'package:amazon/features/home/data/services/product_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplement implements HomeRepo {
  BannersService bannersService = BannersService(dio: Dio());
  CategoriesService categoriesService=CategoriesService(dio: Dio());
  ProductsService productsService=ProductsService(dio: Dio());
  AddToCartService addToCartService=AddToCartService(dio: Dio());
  @override
  Future<Either<Error, List<BannersModel>>> fetchBanners() async {
    try {
      var data = await bannersService.getBanners(endPoint: 'banners');
      List<BannersModel> banners = [];
      for (var i in data['data']) {
        banners.add(BannersModel.fromJson(i));
      }
      return right(banners);
    } on Exception catch (e) {
      return left(e.toString() as Error);
    }
  }

  @override
  Future<Either<Error, List<CategoriesModel>>> fetchCategories()async {
    try {
      var data = await categoriesService.getCategories(endPoint: 'categories');
      List<CategoriesModel> categories = [];
      for (var i in data['data']['data']) {
        categories.add(CategoriesModel.fromJson(i));
      }
      return right(categories);
    } on Exception catch (e) {
      return left(e.toString() as Error);
    }
  }

  @override
        List<ProductModel> products = [];

  Future<Either<Error, List<ProductModel>>> fetchProducts()async {
   try {
      var data = await productsService.getProducts(endPoint:'home');
      for (var i in data['data']['products']) {
        products.add(ProductModel.fromJson(i));
      }
      return right(products);
    } on Exception catch (e) {
      return left(e.toString() as Error);
    }
  }
  
  List<ProductModel> carts = [];
  Set<String> cartsId={} ;

  @override
  Future<Either<Error, List<ProductModel>>> fetchCarts() async{
    try {
      var data = await addToCartService.getCarts(endPoint:'carts');
      for (var i in data['data']['cart_items']['product']) {
        carts.add(ProductModel.fromJson(i));
        cartsId.add(data['data']['cart_items']['product']['id'].toString());
      }
      return right(carts);
    } on Exception catch (e) {
      return left(e.toString() as Error);
    }
  }

}
