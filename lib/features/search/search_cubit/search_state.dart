part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List? message;
  final String? statusCode;
  SearchLoaded(this.message, this.statusCode);
}

class SearchError extends SearchState {
  final List? message;
  final String? statusCode;
  SearchError({this.message, this.statusCode});
}
