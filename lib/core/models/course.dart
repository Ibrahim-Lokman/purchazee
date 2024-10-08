// lib/core/models/course.dart
class Course {
  final String id;
  final String title;
  final String description;
  final double price;
  final bool isPurchased;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.isPurchased = false,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      isPurchased: json['isPurchased'] ?? false,
    );
  }
}
