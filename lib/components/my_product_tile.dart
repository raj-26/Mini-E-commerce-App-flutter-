import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/shops.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({
    super.key,
    required this.product
  });

  // add to cart button pressed
  void addToCart(BuildContext context) {
    // show a dialog box to ask user to
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Add this item to your cart"),
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

                  // add to cart
                  context.read<Shop>().addToCart(product);
                },
              child: const Text('yes'),
            ),

          ],
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [

              //product image
              AspectRatio(
              aspectRatio: 1,
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity, // fill out the entire width
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
              ),
            ),

              const SizedBox(
                height: 25,
              ),

              // product name
              Text(product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),


              // product description
              Text(product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),



          const SizedBox(height: 25),

          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$' + product.price.toStringAsFixed(2)),

              // add to cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
