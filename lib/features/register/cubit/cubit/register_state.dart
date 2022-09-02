part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String? message;
  final String? statusCode;

  RegisterSuccess(this.message, this.statusCode);
}

class RegisterError extends RegisterState {
  final String? message;
  final String? statusCode;

  RegisterError(this.message, this.statusCode);
}
