import 'challenge.dart';

abstract class ChallengeRepository {
  Future<Challenge> getTodayChallenge();
  Future<void> completeChallenge(int id);
  Future<int> getStreak();
}
