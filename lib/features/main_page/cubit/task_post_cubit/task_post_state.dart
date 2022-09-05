part of 'task_post_cubit.dart';

@immutable
abstract class TaskPostState {}

class TeskPostInitial extends TaskPostState {}

class TaskPostLoading extends TaskPostState {}

class TaskPostSuccess extends TaskPostState {
  final List<Message>? message;
  final String? statusCode;

  TaskPostSuccess(this.message, this.statusCode);
}

class TaskPostError extends TaskPostState {
  final List? message;
  final String? statusCode;
  TaskPostError({this.message, this.statusCode});
}
