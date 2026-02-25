import '../domain/challenge.dart';
import '../domain/challenge_repository.dart';
import 'challenge_remote_datasource.dart';

class ChallengeRepositoryImpl
    implements ChallengeRepository {
  final ChallengeRemoteDataSource remote;

  ChallengeRepositoryImpl(this.remote);

  @override
  Future<Challenge> getTodayChallenge() {
    return remote.getTodayChallenge();
  }

  @override
  Future<void> completeChallenge(int id) {
    return remote.completeChallenge(id);
  }

  @override
Future<int> getStreak() {
  return remote.getStreak();
}
  
}