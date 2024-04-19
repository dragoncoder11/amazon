import 'package:amazon/core/utils/constants.dart';
import 'package:dio/dio.dart';

class GetFavouritesService{
  final Dio dio;

  GetFavouritesService({required this.dio});

  Future getFavourites({required String endPoint,})async{
    var response=await dio.get('$baseUrl$endPoint',options: Options(headers: {
      'lang':'en',
      'Content-Type':'application/json',
      'Authorization':userToken,
    }),);
    var data=response.data;
    return data;
  }
}