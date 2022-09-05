part of 'task_delete_cubit.dart';

@immutable
abstract class TaskDeleteState {}

class TaskDeleteInitial extends TaskDeleteState {}

class TaskDeleteLoading extends TaskDeleteState {}

class TaskDeleteSuccess extends TaskDeleteState {
  final List<Message>? message;
  final String? statusCode;

  TaskDeleteSuccess(this.message, this.statusCode);
}

class TaskDeleteError extends TaskDeleteState {
  final List? message;
  final String? statusCode;
  TaskDeleteError({this.message, this.statusCode});
}
