import 'package:get/get.dart';
import 'package:get_x_state/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs; // List of Cart items

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  void addToCart(Product product) {
    cartItems.add(product);
  }
}
