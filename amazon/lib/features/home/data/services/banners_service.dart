import 'package:amazon/core/utils/constants.dart';
import 'package:dio/dio.dart';

class BannersService{
  final Dio dio;

  BannersService({required this.dio});

  Future getBanners({required String endPoint})async{
    var response=await dio.get('$baseUrl$endPoint');
    var data=response.data;
    return data;
  }
}