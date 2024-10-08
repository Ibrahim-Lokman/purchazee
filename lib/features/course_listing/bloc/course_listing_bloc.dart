// lib/features/course_listing/bloc/course_listing_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/course_service.dart';
import 'course_listing_event.dart';
import 'course_listing_state.dart';

class CourseListingBloc extends Bloc<CourseListingEvent, CourseListingState> {
  final CourseService _courseService;

  CourseListingBloc(this._courseService) : super(CourseListingInitial()) {
    on<FetchCourses>(_onFetchCourses);
  }

  Future<void> _onFetchCourses(
      FetchCourses event, Emitter<CourseListingState> emit) async {
    emit(CourseListingLoading());
    try {
      final courses = await _courseService.getCourses();
      emit(CourseListingLoaded(courses));
    } catch (e) {
      emit(CourseListingError(e.toString()));
    }
  }
}
