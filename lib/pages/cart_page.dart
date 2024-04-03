import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Cart Page'
        ),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        foregroundColor:  Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor:  Theme.of(context).colorScheme.background,
    );
  }
}
