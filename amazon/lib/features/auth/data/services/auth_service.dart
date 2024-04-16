
import 'package:amazon/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthService{
  final Dio dio;

  AuthService({required this.dio});

  Future auth({required String endPoint,required Map<String,dynamic>data})async{
    try {
  var response=await dio.post('$baseUrl$endPoint',data:data,options: Options(headers: {
    'lang':'en',
    'Content-Type':'application/json',
  }));
  var body=response.data;
  print(body);
     return body;
}  catch (e) {
  return Text(e.toString());
}
  }
  
}