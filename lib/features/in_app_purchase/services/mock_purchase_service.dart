// lib/features/in_app_purchase/services/mock_purchase_service.dart
import 'purchase_service.dart';

class MockPurchaseService implements PurchaseService {
  @override
  Future<bool> purchaseCourse(String courseId) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    // Simulate successful purchase
    return true;
  }
}
