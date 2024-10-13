// lib/features/course_listing/services/course_service.dart
import '../../../core/models/course.dart';
import '../../../core/services/api_service_interface.dart';

abstract class CourseService {
  Future<List<Course>> getCourses();
}

// class CourseServiceImpl implements CourseService {
//   final ApiServiceInterface _apiService;

//   CourseServiceImpl(this._apiService);

//   @override
//   Future<List<Course>> getCourses() async {
//     return await _apiService.getCourses();
//   }
// }
