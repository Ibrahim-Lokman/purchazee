// // lib/features/in_app_purchase/bloc/purchase_event.dart
// abstract class PurchaseEvent {}

// class PurchaseCourse extends PurchaseEvent {
//   final String courseId;
//   PurchaseCourse(this.courseId);
// }

// Events
abstract class PurchaseEvent {}

class PurchaseCourse extends PurchaseEvent {
  final String courseId;
  PurchaseCourse(this.courseId);
}

class PurchaseSuccess extends PurchaseEvent {}

class PurchaseError extends PurchaseEvent {
  final String error;
  PurchaseError(this.error);
}
