// lib/mocks/mock_courses.dart
import '../core/models/course.dart';

final List<Course> mockCourses = [
  Course(
    id: '1',
    title: 'Flutter Basics',
    description: 'Learn the fundamentals of Flutter development',
    price: 49.99,
    isPurchased: false,
  ),
  Course(
    id: '2',
    title: 'Advanced Dart Programming',
    description: 'Master Dart programming language',
    price: 79.99,
    isPurchased: false,
  ),
  Course(
    id: '3',
    title: 'State Management in Flutter',
    description: 'Explore different state management techniques in Flutter',
    price: 59.99,
    isPurchased: true,
  ),
];
