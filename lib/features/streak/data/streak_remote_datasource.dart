import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../domain/streak.dart';

class StreakRemoteDataSource {
  final Dio dio;

  StreakRemoteDataSource(this.dio);

  Future<Streak> getStreak() async {
    final response =
        await dio.get(ApiConstants.streak);

    return Streak(
      current: response.data['current_streak'],
      longest: response.data['longest_streak'],
    );
  }
}