// import 'package:in_app_purchase/in_app_purchase.dart';

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

// class PurchaseRepository {
//   final InAppPurchase _inAppPurchase = InAppPurchase.instance;

//   Future<bool> buyProduct(String productId) async {
//     final bool available = await _inAppPurchase.isAvailable();
//     if (!available) {
//       print('In-app purchases not available');
//       return false;
//     }

//     final ProductDetailsResponse productDetailResponse =
//         await _inAppPurchase.queryProductDetails({productId});

//     if (productDetailResponse.error != null) {
//       print('Error querying product details: ${productDetailResponse.error}');
//       return false;
//     }

//     if (productDetailResponse.productDetails.isEmpty) {
//       print('No products found');
//       return false;
//     }

//     final PurchaseParam purchaseParam = PurchaseParam(
//       productDetails: productDetailResponse.productDetails.first,
//     );

//     try {
//       final bool success =
//           await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
//       return success;
//     } catch (e) {
//       print('Error during purchase: $e');
//       return false;
//     }
//   }

//   Stream<List<PurchaseDetails>> get purchaseUpdates =>
//       _inAppPurchase.purchaseStream;
// }

import 'dart:async';

class MockPurchaseRepository {
  final _purchaseController =
      StreamController<List<PurchaseDetails>>.broadcast();
  bool _isAvailable = true;

  void setAvailability(bool isAvailable) {
    _isAvailable = isAvailable;
  }

  Future<bool> buyProduct(String productId) async {
    if (!_isAvailable) {
      print('In-app purchases not available');
      return false;
    }

    // Simulate a delay for network request
    await Future.delayed(Duration(seconds: 1));

    // Simulate successful purchase
    final purchase = PurchaseDetails(
      productID: productId,
      status: PurchaseStatus.purchased,
      transactionDate: DateTime.now().toIso8601String(),
    );

    print("Purchanse successfull");

    _purchaseController.add([purchase]);
    return true;
  }

  Future<ProductDetailsResponse> queryProductDetails(
      Set<String> productIds) async {
    // Simulate a delay for network request
    await Future.delayed(Duration(seconds: 1));

    final products = productIds
        .map((id) => ProductDetails(
              id: id,
              title: 'Product $id',
              description: 'This is a mock product $id',
              price: '\$0.99',
              rawPrice: 0.99,
              currencyCode: 'USD',
            ))
        .toList();

    return ProductDetailsResponse(
      productDetails: products,
      notFoundIDs: [],
      error: null,
    );
  }

  Stream<List<PurchaseDetails>> get purchaseUpdates =>
      _purchaseController.stream;

  void dispose() {
    _purchaseController.close();
  }
}

class PurchaseDetails {
  PurchaseDetails({
    required this.productID,
    required this.status,
    required this.transactionDate,
  });

  final String productID;
  final PurchaseStatus status;
  final String transactionDate;
}

enum PurchaseStatus { purchased, pending, error }

class ProductDetails {
  ProductDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rawPrice,
    required this.currencyCode,
  });

  final String id;
  final String title;
  final String description;
  final String price;
  final double rawPrice;
  final String currencyCode;
}

class ProductDetailsResponse {
  ProductDetailsResponse({
    required this.productDetails,
    required this.notFoundIDs,
    this.error,
  });

  final List<ProductDetails> productDetails;
  final List<String> notFoundIDs;
  final String? error;
}
