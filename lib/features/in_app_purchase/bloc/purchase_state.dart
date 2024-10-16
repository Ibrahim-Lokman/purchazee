// lib/features/in_app_purchase/bloc/purchase_state.dart
abstract class PurchaseState {}

class PurchaseInitial extends PurchaseState {}

class PurchaseLoading extends PurchaseState {}

class PurchaseSuccess extends PurchaseState {}

class PurchaseError extends PurchaseState {
  final String message;
  PurchaseError(this.message);
}
