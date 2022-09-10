part of 'task_get_cubit.dart';

@immutable
abstract class TaskGetState {}

class TeskGetInitial extends TaskGetState {}

class TaskGetLoading extends TaskGetState {}

class TaskGetLoaded extends TaskGetState {}

class TaskGetSuccess extends TaskGetState {
  final List<Message>? message;
  final String? statusCode;

  TaskGetSuccess(this.message, this.statusCode);
}

class TaskGetError extends TaskGetState {
  final List? message;
  final String? statusCode;
  TaskGetError({this.message, this.statusCode});
}
