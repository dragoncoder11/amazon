part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class RegisterLoadindState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class FailedToRegisterState extends AuthState {
  final String errMessage;

  FailedToRegisterState({required this.errMessage});
}


final class LoginLoadindState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class FailedToLoginState extends AuthState {
  final String errMessage;

  FailedToLoginState({required this.errMessage});
}
