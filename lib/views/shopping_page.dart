import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_state/controllers/cart_controller.dart';
import 'package:get_x_state/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(
          Icons.add_shopping_cart,
          size: 24,
        ),
        onPressed: () {},
        backgroundColor: Colors.amber,
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.products[index].productName,
                                  style: const TextStyle(fontSize: 24),
                                ),
                                Text(controller
                                    .products[index].productDescription),
                              ],
                            ),
                            Text('\$${controller.products[index].price}',
                                style: const TextStyle(fontSize: 24)),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cartController
                                .addToCart(controller.products[index]);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Цвет фона кнопки
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Add to cart"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total amount: \$ ${controller.totalPrice}',
                style: const TextStyle(color: Colors.white, fontSize: 25),
              );
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
