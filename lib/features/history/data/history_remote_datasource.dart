import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../domain/history_item.dart';

class HistoryRemoteDataSource {
  final Dio dio;

  HistoryRemoteDataSource(this.dio);

  Future<List<HistoryItem>> getHistory() async {
    final response = await dio.get(ApiConstants.challengeHistory);

    final List list = response.data['history'];

    return list
        .map(
          (e) => HistoryItem(
            date: e['date'],
            title: e['title'],
            status: e['status'],
            categoryName: e['category']['name'],
            categoryEmoji: e['category']['emoji'],
          ),
        )
        .toList();
  }
}
