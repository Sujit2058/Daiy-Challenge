import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/challenge.dart';
import '../domain/challenge_repository.dart';

part 'challenge_event.dart';
part 'challenge_state.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  final ChallengeRepository repository;

  ChallengeBloc(this.repository) : super(ChallengeInitial()) {

  on<LoadChallenge>((event, emit) async {
    emit(ChallengeLoading());

    final challenge = await repository.getTodayChallenge();
    final streak = await repository.getStreak();

    emit(
      ChallengeLoaded(
        challenge: challenge,
        streak: streak,
      ),
    );
  });

  on<CompleteChallengeEvent>((event, emit) async {
    await repository.completeChallenge(event.id);

    final challenge = await repository.getTodayChallenge();
    final streak = await repository.getStreak();

    emit(
      ChallengeLoaded(
        challenge: challenge,
        streak: streak,
      ),
    );
  });
}
}