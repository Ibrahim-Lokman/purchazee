// lib/features/in_app_purchase/bloc/purchase_event.dart
abstract class PurchaseEvent {}

class PurchaseCourse extends PurchaseEvent {
  final String courseId;
  PurchaseCourse(this.courseId);
}
