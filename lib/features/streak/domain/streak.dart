import 'package:equatable/equatable.dart';

class Streak extends Equatable {
  final int current;
  final int longest;

  const Streak({required this.current, required this.longest});

  @override
  List<Object?> get props => [current, longest];
}
