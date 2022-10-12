part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String? message;
  final String? statusCode;
  ForgotPasswordSuccess({
    this.message,
    this.statusCode,
  });
}

class ForgotPasswordError extends ForgotPasswordState {
  final String? message;
  final String? statusCode;

  ForgotPasswordError({this.message, this.statusCode});
}
