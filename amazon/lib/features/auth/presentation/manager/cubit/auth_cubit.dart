import 'package:amazon/core/utils/cashe_network.dart';
import 'package:amazon/core/utils/constants.dart';
import 'package:amazon/features/auth/data/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  Future regestration({
    required String userName,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      emit(RegisterLoadindState());
      var data =
          await AuthService(dio: Dio()).auth(endPoint: 'register', data: {
        'name': userName,
        'phone': phone,
        'email': email,
        'password': password,
      });
      if (data['status'] == true) {
        emit(RegisterSuccessState());
      } else {
        emit(FailedToRegisterState(errMessage: data['message']));
      }
    } catch (e) {
      emit(FailedToRegisterState(errMessage: e.toString()));
    }
  }

  //**********************************************************************/
  Future login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoadindState());
      var data = await AuthService(dio: Dio()).auth(endPoint: 'login', data: {
        'email': email,
        'password': password,
      });
      if (data['status'] == true) {
        await CacheNetwork.insertToCache(key: 'token', value: data['data']['token']);
       // await CacheNetwork.insertToCache(key: 'password', value: password);
        userToken = await CacheNetwork.getCacheData(key:'token');
       // userPassword = await CacheNetwork.getCacheData(key: 'password');

        emit(LoginSuccessState());
      } else {
        emit(FailedToLoginState(errMessage: data['message']));
      }
    } catch (e) {
      emit(FailedToLoginState(errMessage: e.toString()));
    }
  }
}
