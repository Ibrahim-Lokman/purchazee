// lib/features/in_app_purchase/services/purchase_service.dart
import 'package:in_app_purchase_poc/core/services/api_service_interface.dart';

abstract class PurchaseService {
  Future<bool> purchaseCourse(String courseId);
}

class PurchaseServiceImpl implements PurchaseService {
  final ApiServiceInterface _apiService;

  PurchaseServiceImpl(this._apiService);

  @override
  Future<bool> purchaseCourse(String courseId) async {
    return await _apiService.purchaseCourse(courseId);
  }
}
