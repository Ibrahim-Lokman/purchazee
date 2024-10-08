// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/course_listing/bloc/course_listing_bloc.dart';
import 'features/course_listing/screens/your_courses_screen.dart';
import 'features/course_listing/screens/more_courses_screen.dart';
import 'features/course_listing/services/mock_course_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CourseListingBloc>(
          create: (context) => CourseListingBloc(MockCourseService()),
        ),
      ],
      child: MaterialApp(
        title: 'In-App Purchase POC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Your Courses'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const YourCoursesScreen()),
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('More Courses'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MoreCoursesScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
