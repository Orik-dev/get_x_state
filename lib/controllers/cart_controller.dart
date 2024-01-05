import 'package:get/get.dart';
import 'package:get_x_state/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs; // List of Cart items

  void addToCart(Product product) {
    cartItems.add(product);
  }
}
