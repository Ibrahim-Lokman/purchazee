// lib/core/models/course.dart
class Course {
  final String id;
  final String title;
  final String description;
  final double price;
  final double discountPrice;
  bool isPurchased;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPrice,
    this.isPurchased = false,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPrice: json['discountPrice'].toDouble(),
      isPurchased: json['isPurchased'] ?? false,
    );
  }
}
