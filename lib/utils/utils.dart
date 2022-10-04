import 'package:flutter/material.dart';
import 'package:yebelo_assign/models/cart_item.dart';
import 'package:yebelo_assign/screens/cart/cart.dart';
import 'package:yebelo_assign/screens/home/home.dart';
import 'package:yebelo_assign/screens/more/more.dart';
import 'package:yebelo_assign/screens/profiile/profile.dart';
import 'package:yebelo_assign/services/database_service.dart';

import '../models/product.dart';

const bottomNavigationBarItems = [Home(), Profile(), Cart(), More()];

const List<String> list = <String>['All Categories', 'Premium', 'Tamilnadu'];

List<DropdownMenuItem<String>> dropDownItems = list.map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  );
}).toList();

List<Product> filter(List<Product> products, String category){

  if(category != "All Categories"){
    products = products.where((product) => product.p_category == category).toList();
  }
  return products;
}


class GetQauntity extends StatefulWidget {
  final Product product;
  const GetQauntity({required this.product});

  @override
  State<GetQauntity> createState() => _GetQauntityState();
}

class _GetQauntityState extends State<GetQauntity> {

  DatabaseService databaseService = DatabaseService();

  TextEditingController _textEditingController = TextEditingController();
  int quantity = 0;
  bool done = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(

      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          width: 100,
          height: 40,
        child: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: "Enter Quantity",
            suffix: IconButton(
              onPressed: ()async{
                if(_textEditingController.text.isNotEmpty) {
                  //print(textEditingController.text);
                  quantity = int.parse(_textEditingController.text);
                  CartItem cartItem = CartItem(product: widget.product, quantity: quantity);
                  await databaseService.createCartItem(cartItem);
                  Navigator.pop(context);
                }

              },
              icon: Icon(Icons.done),)

          ),
        ),
      ),
    ]
    );
  }
}
