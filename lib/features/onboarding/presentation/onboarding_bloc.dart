import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/category.dart';
import '../domain/onboarding_repository.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc
    extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingRepository repository;

  OnboardingBloc(this.repository)
      : super(OnboardingInitial()) {
    on<LoadCategories>((event, emit) async {
      emit(OnboardingLoading());
      final categories = await repository.getCategories();
      emit(CategoriesLoaded(categories));
    });

    on<SubmitPreferences>((event, emit) async {
      emit(OnboardingLoading());
      await repository.savePreferences(event.ids);
      emit(PreferencesSaved());
    });
  }
}