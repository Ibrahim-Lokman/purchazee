import 'package:in_app_purchase/in_app_purchase.dart';

// class PurchaseRepository {
//   final InAppPurchase _inAppPurchase = InAppPurchase.instance;

//   Future<bool> buyProduct(String productId) async {
//     final ProductDetails? product = await _getProduct(productId);
//     if (product == null) return false;

//     final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
//     return _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
//   }

//   Future<ProductDetails?> _getProduct(String productId) async {
//     final Set<String> ids = {productId};
//     final ProductDetailsResponse response =
//         await _inAppPurchase.queryProductDetails(ids);

//     if (response.notFoundIDs.isNotEmpty) return null;
//     return response.productDetails.first;
//   }

//   Stream<List<PurchaseDetails>> get purchaseUpdates =>
//       _inAppPurchase.purchaseStream;
// }

class PurchaseRepository {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  Future<bool> buyProduct(String productId) async {
    final bool available = await _inAppPurchase.isAvailable();
    if (!available) {
      print('In-app purchases not available');
      return false;
    }

    final ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails({productId});

    if (productDetailResponse.error != null) {
      print('Error querying product details: ${productDetailResponse.error}');
      return false;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      print('No products found');
      return false;
    }

    final PurchaseParam purchaseParam = PurchaseParam(
      productDetails: productDetailResponse.productDetails.first,
    );

    try {
      final bool success =
          await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      return success;
    } catch (e) {
      print('Error during purchase: $e');
      return false;
    }
  }

  Stream<List<PurchaseDetails>> get purchaseUpdates =>
      _inAppPurchase.purchaseStream;
}
