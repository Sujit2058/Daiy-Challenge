import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/history_item.dart';
import '../domain/history_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository repository;

  HistoryBloc(this.repository) : super(HistoryInitial()) {
    on<LoadHistory>((event, emit) async {
      emit(HistoryLoading());
      final history = await repository.getHistory();
      emit(HistoryLoaded(history));
    });
  }
}