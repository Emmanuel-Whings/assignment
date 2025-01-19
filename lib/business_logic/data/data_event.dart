part of "data_bloc.dart";

sealed class DataEvent {}

final class LoadEvent extends DataEvent {}

final class LoadUser extends DataEvent {}
