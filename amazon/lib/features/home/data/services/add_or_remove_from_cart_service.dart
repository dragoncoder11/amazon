import 'package:amazon/core/utils/constants.dart';
import 'package:dio/dio.dart';

class AddOrRemoveFromCart{
  final Dio dio;

  AddOrRemoveFromCart({required this.dio});

  Future addOrRemoveFromCart({required String endPoint,required String productId})async{
    var response=await dio.post('$baseUrl$endPoint',options: Options(headers: {
      'lang':'en',
      'Content-Type':'application/json',
      'Authorization':userToken,
    }),data: {
      'product_id':productId
    });
    var data=response.data;
    return data;
  }
}