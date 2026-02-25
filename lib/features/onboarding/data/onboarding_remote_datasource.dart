import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../domain/category.dart';

class OnboardingRemoteDataSource {
  final Dio dio;

  OnboardingRemoteDataSource(this.dio);

  Future<List<Category>> getCategories() async {
    final response = await dio.get(ApiConstants.categories);

    final List list = response.data['categories'];

    return list
        .map((e) => Category(id: e['id'], name: e['name'], emoji: e['emoji']))
        .toList();
  }

  Future<void> savePreferences(List<int> ids) async {
    await dio.post(ApiConstants.preferences, data: {"category_ids": ids});
  }
}
