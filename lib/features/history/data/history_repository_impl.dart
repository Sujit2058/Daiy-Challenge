import '../domain/history_item.dart';
import '../domain/history_repository.dart';
import 'history_remote_datasource.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryRemoteDataSource remote;

  HistoryRepositoryImpl(this.remote);

  @override
  Future<List<HistoryItem>> getHistory() {
    return remote.getHistory();
  }
}
