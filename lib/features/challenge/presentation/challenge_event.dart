part of 'challenge_bloc.dart';

abstract class ChallengeEvent {}

class LoadChallenge extends ChallengeEvent {}

class CompleteChallengeEvent extends ChallengeEvent {
  final int id;

  CompleteChallengeEvent(this.id);
}

class LoadStreak extends ChallengeEvent {}
