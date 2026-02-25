part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {}

class LoadCategories extends OnboardingEvent {}

class SubmitPreferences extends OnboardingEvent {
  final List<int> ids;

  SubmitPreferences(this.ids);
}
