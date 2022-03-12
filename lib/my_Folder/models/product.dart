import 'package:get/state_manager.dart';

class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;
  int qtn;

  Product({
    this.id,
    this.productName,
    this.productImage,
    this.productDescription,
    this.price,
    this.qtn,
  });

  final isFavorite = false.obs;
}
