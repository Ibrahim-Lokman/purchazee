// lib/features/course_listing/services/mock_course_service.dart
import 'package:in_app_purchase_poc/mocks/mock_courses.dart';

import '../../../core/models/course.dart';
import 'course_service.dart';

class MockCourseService implements CourseService {
  @override
  Future<List<Course>> getCourses() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return mockCourses;
    //  [
    //   Course(
    //     id: 'C001',
    //     title: 'Flutter Basics',
    //     description: 'Learn the fundamentals of Flutter development',
    //     price: 49.99,
    //     discountPrice: 39.99,
    //     isPurchased: false,
    //   ),
    //   Course(
    //     id: 'C002',
    //     title: 'Advanced Dart Programming',
    //     description: 'Master Dart programming language',
    //     price: 79.99,
    //     discountPrice: 69.99,
    //     isPurchased: false,
    //   ),
    //   Course(
    //     id: 'C003',
    //     title: 'State Management in Flutter',
    //     description: 'Explore different state management techniques in Flutter',
    //     price: 59.99,
    //     discountPrice: 49.99,
    //     isPurchased: true,
    //   ),
    //   Course(
    //     id: 'C004',
    //     title: 'Building Responsive UIs',
    //     description: 'Learn to create responsive user interfaces in Flutter',
    //     price: 55.00,
    //     discountPrice: 45.00,
    //     isPurchased: false,
    //   ),
    //   Course(
    //     id: 'C005',
    //     title: 'Flutter and Firebase Integration',
    //     description: 'Integrate Firebase services with Flutter applications',
    //     price: 69.99,
    //     discountPrice: 59.99,
    //     isPurchased: false,
    //   ),
    //   Course(
    //     id: 'C006',
    //     title: 'API Integration with Dart',
    //     description: 'Understand how to work with APIs in Dart',
    //     price: 39.99,
    //     discountPrice: 29.99,
    //     isPurchased: false,
    //   ),
    //   Course(
    //     id: 'C007',
    //     title: 'Animation in Flutter',
    //     description: 'Create beautiful animations in your Flutter apps',
    //     price: 44.99,
    //     discountPrice: 34.99,
    //     isPurchased: false,
    //   ),
    // ];
  }
}
