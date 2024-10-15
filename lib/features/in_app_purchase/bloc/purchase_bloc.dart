// lib/features/in_app_purchase/bloc/purchase_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_poc/core/services/api_service.dart';
import 'package:in_app_purchase_poc/core/services/api_service_interface.dart';
import 'package:in_app_purchase_poc/features/in_app_purchase/repository/purchase_repository.dart';
import 'package:in_app_purchase_poc/mocks/mock_courses.dart';
import '../services/purchase_service.dart';
import 'purchase_event.dart';
import 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final PurchaseRepository _repository;

  PurchaseBloc(this._repository) : super(PurchaseInitial()) {
    on<PurchaseCourse>(_onBuyProduct);

    _repository.purchaseUpdates.listen((purchases) {
      for (var purchase in purchases) {
        if (purchase.status == PurchaseStatus.purchased) {
          // Handle successful purchase
          add(PurchaseSuccess() as PurchaseEvent);
        } else if (purchase.status == PurchaseStatus.error) {
          // Handle purchase error
          add(PurchaseError(purchase.error!.message) as PurchaseEvent);
        }
      }
    });
  }

  Future<void> _onBuyProduct(
      PurchaseCourse event, Emitter<PurchaseState> emit) async {
    emit(PurchaseLoading());
    final bool success = await _repository.buyProduct(event.courseId);
    if (!success) {
      emit(PurchaseError('Failed to initiate purchase'));
    }
  }
}
