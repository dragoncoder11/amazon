import 'package:amazon/core/utils/constants.dart';
import 'package:dio/dio.dart';

class GetCardsService{
  final Dio dio;

  GetCardsService({required this.dio});

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