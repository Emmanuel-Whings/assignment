part of "data_bloc.dart";

sealed class DataState {}

final class LoadingState extends DataState {
  final String message;
  LoadingState({this.message = "Loading users.."});
}

final class ErrorState extends DataState {
  final String message;
  ErrorState({required this.message});
}

final class EmptyState extends DataState {
  final String message;
  EmptyState({this.message = "No user"});
}

final class AvailableState extends DataState {
  final List<User> data;
  AvailableState({required this.data});
}
