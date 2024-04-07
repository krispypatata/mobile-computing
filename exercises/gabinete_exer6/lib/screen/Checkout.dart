import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import "../provider/shoppingcart_provider.dart";

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    bool hasItems = products.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Item Details'),
          const Divider(
            height: 4,
            thickness: 0.5,
            // color: Colors.black,
          ),
          getItems(context),
          Visibility(
            visible: hasItems,
            child: Flexible(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Divider(
                    height: 4,
                    thickness: 0.5,
                    // color: Colors.black,
                  ),
                  // TOTAL COST
                  computeCost(),
                  // RESET BUTTON
                  ElevatedButton(
                    onPressed: () {
                      context.read<ShoppingCart>().removeAll();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Payment Successful!"),
                          duration: Duration(seconds: 1, milliseconds: 100),
                        ),
                      );
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName('/products'),
                      );
                    },
                    child: const Text("Pay Now!"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    String productname = "";
    return products.isEmpty
        ? const Text('No items to checkout!')
        : Expanded(
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return ListTile(
                        title: Text(products[index].name),
                        trailing: Text(
                          products[index].price.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }

  Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Text("Total Cost to Pay: ${cart.cartTotal}");
    });
  }
}
