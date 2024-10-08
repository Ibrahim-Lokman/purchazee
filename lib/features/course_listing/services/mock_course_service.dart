// lib/features/course_listing/services/mock_course_service.dart
import '../../../core/models/course.dart';
import 'course_service.dart';

class MockCourseService implements CourseService {
  @override
  Future<List<Course>> getCourses() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      Course(
          id: '1',
          title: 'Flutter Basics',
          description: 'Learn Flutter fundamentals',
          price: 49.99,
          isPurchased: true),
      Course(
          id: '2',
          title: 'Advanced Dart',
          description: 'Master Dart programming',
          price: 79.99),
      Course(
          id: '3',
          title: 'State Management',
          description: 'Explore state management techniques',
          price: 59.99),
    ];
  }
}
