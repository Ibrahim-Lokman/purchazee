// lib/features/course_details/bloc/course_details_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/api_service_interface.dart';
import 'course_details_event.dart';
import 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  final ApiServiceInterface _apiService;

  CourseDetailsBloc(this._apiService) : super(CourseDetailsInitial()) {
    on<FetchCourseDetails>(_onFetchCourseDetails);
  }

  Future<void> _onFetchCourseDetails(
      FetchCourseDetails event, Emitter<CourseDetailsState> emit) async {
    emit(CourseDetailsLoading());
    try {
      final course = await _apiService.getCourseDetails(event.courseId);
      emit(CourseDetailsLoaded(course));
    } catch (e) {
      emit(CourseDetailsError(e.toString()));
    }
  }
}
