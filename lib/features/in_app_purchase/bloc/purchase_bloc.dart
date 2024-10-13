// lib/features/in_app_purchase/bloc/purchase_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase_poc/core/services/api_service.dart';
import 'package:in_app_purchase_poc/core/services/api_service_interface.dart';
import 'package:in_app_purchase_poc/mocks/mock_courses.dart';
import '../services/purchase_service.dart';
import 'purchase_event.dart';
import 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  //final PurchaseService _purchaseService;

  final ApiServiceInterface _purchaseService;

  PurchaseBloc(this._purchaseService) : super(PurchaseInitial()) {
    on<PurchaseCourse>(_onPurchaseCourse);
  }

  Future<void> _onPurchaseCourse(
      PurchaseCourse event, Emitter<PurchaseState> emit) async {
    emit(PurchaseLoading());
    try {
      final success = await _purchaseService.purchaseCourse(event.courseId);
      if (success) {
        mockCourses
            .firstWhere((course) => course.id == event.courseId)
            .isPurchased = true;
        emit(PurchaseSuccess());
      } else {
        emit(PurchaseError('Purchase failed'));
      }
    } catch (e) {
      emit(PurchaseError(e.toString()));
    }
  }
}
