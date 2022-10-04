import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yebelo_assign/screens/cart/cart_list.dart';

import '../../models/cart_item.dart';
import '../../services/database_service.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My cart", style: TextStyle(color: Colors.cyan)),
          shape:
              Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1.5)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: StreamProvider<List<CartItem>>.value(
            initialData: [],
            value: DatabaseService().cartItems,
            child: Column(
              children: [
                const Expanded(child: CartList()),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color?>(Colors.orange)),
                    child: const Text(
                      "Place Order",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            )));
  }
}
