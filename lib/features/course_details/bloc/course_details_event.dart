// lib/features/course_details/bloc/course_details_event.dart
abstract class CourseDetailsEvent {}

class FetchCourseDetails extends CourseDetailsEvent {
  final String courseId;
  FetchCourseDetails(this.courseId);
}
