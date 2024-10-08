// lib/features/course_listing/bloc/course_listing_state.dart
import '../../../core/models/course.dart';

abstract class CourseListingState {}

class CourseListingInitial extends CourseListingState {}

class CourseListingLoading extends CourseListingState {}

class CourseListingLoaded extends CourseListingState {
  final List<Course> courses;

  CourseListingLoaded(this.courses);
}

class CourseListingError extends CourseListingState {
  final String message;

  CourseListingError(this.message);
}
