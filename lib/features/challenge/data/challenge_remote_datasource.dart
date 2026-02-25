import 'package:dio/dio.dart';
import '../domain/challenge.dart';
import '../../../core/constants/api_constants.dart';

class ChallengeRemoteDataSource {
  final Dio dio;

  ChallengeRemoteDataSource(this.dio);

  Future<Challenge> getTodayChallenge() async {
    final response = await dio.get('challenge/today');
    return Challenge.fromJson(response.data);
  }

  Future<void> completeChallenge(int id) async {
    await dio.post('challenge/complete', data: {"challenge_id": id});
  }

  Future<int> getStreak() async {
    final response = await dio.get(ApiConstants.streak);
    return response.data['count'];
  }
}
