import 'package:amazon/core/utils/constants.dart';
import 'package:dio/dio.dart';

class CategoriesService{
  final Dio dio;

  CategoriesService({required this.dio});

  Future getCategories({required String endPoint})async{
    var response=await dio.get('$baseUrl$endPoint',options: Options(headers: {
      'lang':'en',
    }));
    var data=response.data;
    return data;
  }
}