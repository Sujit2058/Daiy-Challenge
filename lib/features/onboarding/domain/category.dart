class Category {
  final int id;
  final String name;
  final String emoji;

  Category({required this.id, required this.name, required this.emoji});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: int.parse(json['id'].toString()),
      name: json['name'] ?? '',
      emoji: json['emoji'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "emoji": emoji};
  }
}
