part of 'task_update_cubit.dart';

@immutable
abstract class TaskUpdateState {}

class TaskUpdateInitial extends TaskUpdateState {}

class TaskUpdateLoading extends TaskUpdateState {}

class TaskUpdateSuccess extends TaskUpdateState {
  TaskUpdateSuccess(this.message, this.statusCode);

  final List<Message>? message;
  final String? statusCode;
}

class TaskUpdateError extends TaskUpdateState {
  TaskUpdateError(this.statusCode);

  final String? statusCode;
}
