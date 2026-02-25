part of 'challenge_bloc.dart';

abstract class ChallengeState {}

class ChallengeInitial extends ChallengeState {}

class ChallengeLoading extends ChallengeState {}

class ChallengeLoaded extends ChallengeState {
  final Challenge challenge;
  final int streak;

  ChallengeLoaded({
    required this.challenge,
    required this.streak,
  });
}