// lib/features/course_details/screens/course_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase_poc/core/services/api_service_interface.dart';
import 'package:in_app_purchase_poc/features/in_app_purchase/screens/payment_screen.dart';
import '../bloc/course_details_bloc.dart';
import '../bloc/course_details_event.dart';
import '../bloc/course_details_state.dart';
import '../widgets/buy_now_button.dart';

class CourseDetailsScreen extends StatefulWidget {
  final String courseId;

  const CourseDetailsScreen({Key? key, required this.courseId})
      : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<CourseDetailsBloc>().add(FetchCourseDetails(widget.courseId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course Details')),
      body: BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
        builder: (context, state) {
          if (state is CourseDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CourseDetailsLoaded) {
            return Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.course.title,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  Text(state.course.description),
                  const SizedBox(height: 20),
                  Text('Price: \$${state.course.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  if (!state.course.isPurchased)
                    BuyNowButton(
                      onPressed: () {
                        // Navigate to payment screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    PaymentScreen(courseId: state.course.id)));
                      },
                    ),
                ],
              ),
            );
          } else if (state is CourseDetailsError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
