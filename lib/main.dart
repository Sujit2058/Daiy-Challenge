import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'core/storage/hive_service.dart';

import 'features/onboarding/presentation/onboarding_page.dart';
import 'features/onboarding/presentation/onboarding_bloc.dart';
import 'features/challenge/presentation/challenge_bloc.dart';
import 'features/history/presentation/history_bloc.dart';
import 'home_navigation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  final hiveService = HiveService();
  await hiveService.init();

  // Initialize dependency injection
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<OnboardingBloc>()),
        BlocProvider(create: (_) => di.sl<ChallengeBloc>()),
        BlocProvider(create: (_) => di.sl<HistoryBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => const OnboardingPage(),
          '/home': (_) => const HomeNavigationPage(),
        },
      ),
    );
  }
}