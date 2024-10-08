// lib/features/course_listing/screens/your_courses_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/course_listing_bloc.dart';
import '../bloc/course_listing_event.dart';
import '../bloc/course_listing_state.dart';
import '../widgets/course_card.dart';

class YourCoursesScreen extends StatelessWidget {
  const YourCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Courses')),
      body: BlocBuilder<CourseListingBloc, CourseListingState>(
        builder: (context, state) {
          if (state is CourseListingInitial) {
            BlocProvider.of<CourseListingBloc>(context).add(FetchCourses());
            return const Center(child: CircularProgressIndicator());
          } else if (state is CourseListingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CourseListingLoaded) {
            final purchasedCourses =
                state.courses.where((course) => course.isPurchased).toList();
            return ListView.builder(
              itemCount: purchasedCourses.length,
              itemBuilder: (context, index) {
                return CourseCard(
                  course: purchasedCourses[index],
                  onTap: () {
                    // Navigate to course details
                  },
                );
              },
            );
          } else if (state is CourseListingError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
