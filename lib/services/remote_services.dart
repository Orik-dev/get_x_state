import 'package:get_x_state/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var url = Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return [];
    }
  }
}
