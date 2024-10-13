// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_poc/core/services/api_service.dart';
import 'package:in_app_purchase_poc/core/services/api_service_interface.dart';
import 'package:in_app_purchase_poc/features/course_details/bloc/course_details_bloc.dart';
import 'package:in_app_purchase_poc/features/in_app_purchase/bloc/purchase_bloc.dart';
import 'package:in_app_purchase_poc/features/in_app_purchase/repository/purchase_repository.dart';
import 'package:in_app_purchase_poc/features/in_app_purchase/services/purchase_service.dart';
import 'features/course_listing/bloc/course_listing_bloc.dart';
import 'features/course_listing/screens/your_courses_screen.dart';
import 'features/course_listing/screens/more_courses_screen.dart';
import 'features/course_listing/services/mock_course_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InAppPurchase.instance.isAvailable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiServiceInterface>(
          create: (context) => ApiService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CourseListingBloc>(
            create: (context) => CourseListingBloc(MockCourseService()),
          ),
          BlocProvider<CourseDetailsBloc>(
            create: (context) =>
                CourseDetailsBloc(context.read<ApiServiceInterface>()),
          ),
          BlocProvider<PurchaseBloc>(
            create: (context) => PurchaseBloc(PurchaseRepository()),
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
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Your Courses'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const YourCoursesScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('More Courses'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MoreCoursesScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
