import 'package:amazon/core/utils/constants.dart';
import 'package:dio/dio.dart';

class AddToCartService{
  final Dio dio;

  AddToCartService({required this.dio});

  Future getCarts({required String endPoint,})async{
    var response=await dio.get('$baseUrl$endPoint',options: Options(headers: {
      'lang':'en',
      'Content-Type':'application/json',
      'Authorization':userToken,
    }),);
    var data=response.data;
    return data;
  }
}