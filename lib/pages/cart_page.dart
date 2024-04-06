import 'package:ecommerceapp_dart/components/my_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/shops.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // remove item from cart method
  void removeitemFromCart(BuildContext context, Product product) {
    // show a dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("remove this item to your cart"),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('cancel'),
          ),

          // yes button
          MaterialButton(
            onPressed: () {

              // pop dialog box
              Navigator.pop(context);

              // remove from cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text('yes'),
          )
        ],
      ),
    );
  }

  // user pressed pay button
  void payButtonPressed(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text(
          'User wants to pay! Connect this app to your payment backend'
        ),
      ),
  );
  }

  @override
  Widget build(BuildContext context) {

    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Cart Page',
            style: TextStyle(fontSize: 18),
        ),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        foregroundColor:  Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor:  Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
              child: cart.isEmpty?
              const Center(
                  child: Text('Your cart is empty')):
              ListView.builder(
                itemCount: cart.length,
                  itemBuilder: (context, index) {
                    // get individual item in cart
                    final item = cart[index];

                    // return as a cart tile UI
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => removeitemFromCart(context, item),
                      ),

                    );
                  },
              ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context), child: const Text("PAY NOW"),
            ),
          ),
        ],
      ),
    );
  }
}
