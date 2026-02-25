import 'package:daily_challange/features/challenge/data/challenge_remote_datasource.dart';
import 'package:daily_challange/features/challenge/data/challenge_repository_impl.dart';
import 'package:daily_challange/features/challenge/domain/challenge_repository.dart';
import 'package:daily_challange/features/challenge/presentation/challenge_bloc.dart';
import 'package:daily_challange/features/history/data/history_remote_datasource.dart';
import 'package:daily_challange/features/history/data/history_repository_impl.dart';
import 'package:daily_challange/features/history/domain/history_repository.dart';
import 'package:daily_challange/features/history/presentation/history_bloc.dart';
import 'package:daily_challange/features/streak/data/streak_remote_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'core/network/dio_client.dart';
import 'core/storage/hive_service.dart';

import 'features/onboarding/data/onboarding_remote_datasource.dart';
import 'features/onboarding/data/onboarding_repository_impl.dart';
import 'features/onboarding/domain/onboarding_repository.dart';
import 'features/onboarding/presentation/onboarding_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);
  sl.registerLazySingleton(() => HiveService());

  // Onboarding
  sl.registerLazySingleton(() => OnboardingRemoteDataSource(sl()));

  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl(), sl()),
  );

  sl.registerFactory(() => OnboardingBloc(sl()));

  // Challenge
  sl.registerLazySingleton(() => ChallengeRemoteDataSource(sl()));

  sl.registerLazySingleton<ChallengeRepository>(
    () => ChallengeRepositoryImpl(sl()),
  );

  sl.registerFactory(() => ChallengeBloc(sl()));

  // History
  sl.registerLazySingleton(() => HistoryRemoteDataSource(sl()));

  sl.registerLazySingleton<HistoryRepository>(
    () => HistoryRepositoryImpl(sl()),
  );

  sl.registerFactory(() => HistoryBloc(sl()));

  // Streak
  sl.registerLazySingleton(() => StreakRemoteDataSource(sl()));
}
