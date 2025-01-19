import "dart:developer";
import "package:assignment/models/data/user_model.dart";
import "package:assignment/services/repositories/data_repository.dart";
import "package:flutter_bloc/flutter_bloc.dart";

part "data_event.dart";
part "data_state.dart";

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepository;

  DataBloc({required this.dataRepository}) : super(LoadingState()) {
    on<LoadEvent>((event, emit) async {
      emit(LoadingState());
      List<User> users = [];
      try {
        users = await dataRepository.getAllUsers();
      } on Exception catch (e) {
        log(e.toString());
        emit(ErrorState(message: "Issue loading users"));
        return;
      }
      if (users.isEmpty) return emit(EmptyState());
      emit(AvailableState(data: users));
    });
  }
}
