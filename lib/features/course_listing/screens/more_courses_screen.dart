// lib/features/course_listing/screens/more_courses_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase_poc/features/course_details/screens/course_details_screen.dart';
import '../bloc/course_listing_bloc.dart';
import '../bloc/course_listing_event.dart';
import '../bloc/course_listing_state.dart';
import '../widgets/course_card.dart';

class MoreCoursesScreen extends StatelessWidget {
  const MoreCoursesScreen({super.key});
  TextStyle get _textStyle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More Courses')),
      body: BlocBuilder<CourseListingBloc, CourseListingState>(
        builder: (context, state) {
          if (state is CourseListingInitial) {
            BlocProvider.of<CourseListingBloc>(context).add(FetchCourses());
            return const Center(child: CircularProgressIndicator());
          } else if (state is CourseListingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CourseListingLoaded) {
            final availableCourses =
                state.courses.where((course) => !course.isPurchased).toList();
            return ListView.builder(
              itemCount: availableCourses.length,
              itemBuilder: (context, index) {
                return CourseCard(
                  course: availableCourses[index],
                  onTap: () {
                    // Scaffold.of(context).showBottomSheet(
                    //   elevation: 20,
                    //   enableDrag: true,
                    //   (context) => Container(
                    //     decoration: const BoxDecoration(
                    //       color: Colors.blueGrey,
                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(20),
                    //         topRight: Radius.circular(20),
                    //       ),
                    //     ),
                    //     height: 200,
                    //     width: double.infinity,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Text(
                    //           availableCourses[index].id,
                    //           style: _textStyle.copyWith(
                    //             fontSize: 24,
                    //             color: Colors.red,
                    //           ),
                    //         ),
                    //         Text(
                    //           availableCourses[index].description,
                    //           style: _textStyle,
                    //         ),
                    //         Text(
                    //           'Price: \$${availableCourses[index].price}',
                    //           style: _textStyle,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );

                    // Navigate to course details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseDetailsScreen(
                                courseId: availableCourses[index].id,
                              )),
                    );
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
