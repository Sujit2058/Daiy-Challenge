import '../../onboarding/domain/category.dart';

class Challenge {
  final int id;
  final String title;
  final String difficulty;
  final bool completed;
  final Category category;

  Challenge({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.completed,
    required this.category,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: int.parse(json['id'].toString()),
      title: json['title'] ?? '',
      difficulty: json['difficulty'] ?? '',
      completed: json['completed'] ?? false,
      category: Category.fromJson(json['category']),
    );
  }
}