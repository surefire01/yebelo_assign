import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yebelo_assign/models/cart_item.dart';

import 'cart_item_tile.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<List<CartItem>?>(context);

    return ListView.builder(
      itemCount: cartItems!.length,
      itemBuilder: (context, index) {
        return CartItemTile(cartItem: cartItems[index],);
      },
    );
  }
}
