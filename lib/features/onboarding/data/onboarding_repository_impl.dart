import '../../../core/storage/hive_service.dart';
import '../domain/category.dart';
import '../domain/onboarding_repository.dart';
import 'onboarding_remote_datasource.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource remote;
  final HiveService hive;

  OnboardingRepositoryImpl(this.remote, this.hive);

  @override
  Future<List<Category>> getCategories() {
    return remote.getCategories();
  }

  @override
  Future<void> savePreferences(List<int> ids) async {
    await remote.savePreferences(ids);

    hive.settings.put('onboarding_completed', true);
    hive.settings.put('selected_categories', ids);
  }

  @override
  bool isOnboardingCompleted() {
    return hive.settings.get('onboarding_completed', defaultValue: false);
  }
}