import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/my_Folder/controllers/cart_controller.dart';

class DetailsCart extends StatelessWidget {
DetailsCart({Key key}) : super(key: key);
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GetX<CartController>(
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${controller.cartItems[index].productName}',
                                  style: TextStyle(fontSize: 24),
                                ),
                                Text(
                                    '${controller.cartItems[index].productDescription}'),
                              ],
                            ),
                            Text('\$${controller.cartItems[index].price}',
                                style: TextStyle(fontSize: 24)),
                          ],
                        ),
                        RaisedButton(
                          onPressed: () {
                            cartController.addToCart(controller.cartItems[index]);
                            //cartController.addItemToCart(controller.products[index]);
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text('Add'),
                        ),
                        RaisedButton(
                          onPressed: () {
                            cartController.removeToCart(controller.cartItems[index]);
                            //cartController.addItemToCart(controller.products[index]);
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text('remove'),
                        ),
                        // Obx(() => IconButton(
                        //   icon: controller
                        //       .products[index].isFavorite.value
                        //       ? Icon(Icons.check_box_rounded)
                        //       : Icon(Icons
                        //       .check_box_outline_blank_outlined),
                        //   onPressed: () {
                        //     controller.products[index].isFavorite
                        //         .toggle();
                        //   },
                        // )
                        // )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
