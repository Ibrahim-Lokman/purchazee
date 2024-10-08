// // lib/core/services/api_service.dart
// import 'api_service_interface.dart';
// import '../models/course.dart';

// class ApiService implements ApiServiceInterface {
//   @override
//   Future<List<Course>> getCourses() async {
//     // In a real implementation, this would make an HTTP request
//     // For now, we'll return an empty list
//     return [];
//   }

//   @override
//   Future<Course> getCourseDetails(String courseId) async {
//     // In a real implementation, this would make an HTTP request
//     // For now, we'll throw an exception
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> purchaseCourse(String courseId) async {
//     // In a real implementation, this would make an HTTP request
//     // For now, we'll throw an exception
//     throw UnimplementedError();
//   }
// }

// lib/core/services/api_service.dart (update)
import 'api_service_interface.dart';
import '../models/course.dart';
import '../../mocks/mock_courses.dart';

class ApiService implements ApiServiceInterface {
  @override
  Future<List<Course>> getCourses() async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 1));
    return mockCourses;
  }

  @override
  Future<Course> getCourseDetails(String courseId) async {
    // Simulating network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return mockCourses.firstWhere((course) => course.id == courseId);
  }

  @override
  Future<bool> purchaseCourse(String courseId) async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 2));
    // Simulating successful purchase
    return true;
  }
}
