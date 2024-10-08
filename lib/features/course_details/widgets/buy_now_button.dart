// lib/features/course_details/widgets/buy_now_button.dart
import 'package:flutter/material.dart';

class BuyNowButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BuyNowButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      child: const Text('Buy Now'),
    );
  }
}
