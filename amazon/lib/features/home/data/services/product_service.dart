import 'package:amazon/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ProductsService{
  final Dio dio;

  ProductsService({required this.dio});

  Future getProducts({required String endPoint})async{
    var response=await dio.get('$baseUrl$endPoint',options: Options(headers: {
      'lang':'en',
    }));
    var data=response.data;
    return data;
  }
}