import 'history_item.dart';

abstract class HistoryRepository {
  Future<List<HistoryItem>> getHistory();
}
