import 'package:equatable/equatable.dart';

class HistoryItem extends Equatable {
  final String date;
  final String title;
  final String status;
  final String categoryName;
  final String categoryEmoji;

  const HistoryItem({
    required this.date,
    required this.title,
    required this.status,
    required this.categoryName,
    required this.categoryEmoji,
  });

  @override
  List<Object?> get props => [date, title, status];
}
