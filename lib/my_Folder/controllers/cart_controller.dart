import 'package:get/state_manager.dart';
import 'package:shopping/my_Folder/models/product.dart';


class CartController extends GetxController {
  var cartItems = List<Product>().obs;
  //vst<Product>();
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  var totalAmount = RxDouble(0);


  addToCart(Product product) {
    cartItems.add(product);
    product.qtn++;
    _totalAmountGet();
    print(product.qtn);
  }
  removeToCart(Product product){
    if(product.qtn>0){
      cartItems.remove(product);
      product.qtn--;
      _totalAmountGet();
    }
    print(product.qtn);
  }

  _totalAmountGet() {
    totalAmount.value = cartItems.fold(0, (previous, current) => previous + current.price * current.qtn);
  }


  addItemToCart(Product product) {
    print("adding ${product.productName}");
    //
    // if(product.quantity>0){
    //   product.quantity++;
    // }
    //Product found = _cart.firstWhere((p) => p.id == product.id, orElse: () => null);
    //Product found = cartItems.firstWhere((element) => element.id==product.id,);
    final int index = cartItems.indexWhere((item) => item.id == product.id);
    if (index != null) {
      product.qtn += 1;

    } else {
      cartItems.add(product);
      product.qtn += 1;
    }
  }

  int getCartQuantity() {
    //var totalAmount = RxDouble(0);
    int total = 0;
    for (Product p in cartItems) {
      total += p.qtn;
    }
    return total;
  }

  double getCartTotal() {
    double price = 0;
    for (Product p in cartItems) {
      price += (p.price * p.qtn);
    }
    return price;
  }
}
