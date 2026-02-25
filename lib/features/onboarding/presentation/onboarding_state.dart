part of 'onboarding_bloc.dart';

abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class CategoriesLoaded extends OnboardingState {
  final List<Category> categories;

  CategoriesLoaded(this.categories);
}

class PreferencesSaved extends OnboardingState {}