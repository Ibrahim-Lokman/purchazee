// lib/core/services/api_service_interface.dart
import '../models/course.dart';

abstract class ApiServiceInterface {
  Future<List<Course>> getCourses();
  Future<Course> getCourseDetails(String courseId);
  Future<bool> purchaseCourse(String courseId);
}
