part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String? message;
  final String? statusCode;

  LoginSuccess({this.message, this.statusCode});
}

class LoginError extends LoginState {
  final String? message;
  final String? statusCode;
  LoginError({this.message, this.statusCode});
}
