part of 'forgot_question_cubit_cubit.dart';

@immutable
abstract class ForgotQuestionState {}

class ForgotQuestionCubitInitial extends ForgotQuestionState {}

class ForgotQuestionLoading extends ForgotQuestionState {}

class ForgotQuestionSuccess extends ForgotQuestionState {
  final String? message;
  final String? statusCode;

  ForgotQuestionSuccess({
    required this.message,
    required this.statusCode,
  });
}

class ForgotQuestionError extends ForgotQuestionState {
  final String? message;
  final String? statusCode;

  ForgotQuestionError({
    required this.message,
    required this.statusCode,
  });
}
