import 'package:flutter/material.dart';

import 'my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child:  Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 70,
                    color: Theme.of(context).colorScheme.inversePrimary ,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // shop tile
              MylistTile(
                text: 'Shop',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              // const SizedBox(height: 25),

              // cart tile
              MylistTile(
                text: 'Cart',
                icon: Icons.shopping_cart,
                onTap: () {
                  // pop drawer first
                  Navigator.pop(context);

                  // go to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),
          // drawer header: logo

          // const SizedBox(height: 25),

          // exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MylistTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, '/intro_page', (route) => false),
              ),
            ),
        ],
      ),
    );
  }
}
