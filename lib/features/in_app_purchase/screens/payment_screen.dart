// lib/features/in_app_purchase/screens/payment_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase_poc/features/in_app_purchase/services/purchase_service.dart';
import '../bloc/purchase_bloc.dart';
import '../bloc/purchase_event.dart';
import '../bloc/purchase_state.dart';

class PaymentScreen extends StatefulWidget {
  final String courseId;

  const PaymentScreen({Key? key, required this.courseId}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: BlocConsumer<PurchaseBloc, PurchaseState>(
        listener: (context, state) {
          if (state is PurchaseSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Purchase successful!')));
            Navigator.of(context).popUntil((route) => route.isFirst);
          } else if (state is PurchaseError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')));
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Proceed with payment for course: ${widget.courseId}'),
                const SizedBox(height: 20),
                if (state is PurchaseLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<PurchaseBloc>()
                          .add(PurchaseCourse(widget.courseId));
                    },
                    child: const Text('Confirm Payment'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
