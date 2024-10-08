// lib/features/course_listing/widgets/course_card.dart
import 'package:flutter/material.dart';
import '../../../core/models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const CourseCard({Key? key, required this.course, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(course.title),
        subtitle: Text(course.description),
        trailing: Text('\$${course.price.toStringAsFixed(2)}'),
        onTap: onTap,
      ),
    );
  }
}
