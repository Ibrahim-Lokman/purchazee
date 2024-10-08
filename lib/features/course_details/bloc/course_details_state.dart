// lib/features/course_details/bloc/course_details_state.dart
import '../../../core/models/course.dart';

abstract class CourseDetailsState {}

class CourseDetailsInitial extends CourseDetailsState {}

class CourseDetailsLoading extends CourseDetailsState {}

class CourseDetailsLoaded extends CourseDetailsState {
  final Course course;
  CourseDetailsLoaded(this.course);
}

class CourseDetailsError extends CourseDetailsState {
  final String message;
  CourseDetailsError(this.message);
}
