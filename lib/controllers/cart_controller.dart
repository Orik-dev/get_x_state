import 'package:get/get.dart';
import 'package:get_x_state/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs; // List of Cart items
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  var testAmount = 0.0;
  void addToCart(Product product) {
    cartItems.add(product);
    testAmount = totalPrice;
    update();
  }
}
