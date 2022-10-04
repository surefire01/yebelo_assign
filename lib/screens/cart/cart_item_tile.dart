import 'package:flutter/material.dart';
import 'package:yebelo_assign/models/cart_item.dart';
import 'package:yebelo_assign/models/product.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;
  late final Product product;
  CartItemTile({required this.cartItem}){
    product = cartItem.product!;
  }



  @override
  Widget build(BuildContext context) {



    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Image(
                    image: AssetImage(product.p_image),
                  ),
                )),
            SizedBox(width: 30,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.p_name,style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 22),),
                  SizedBox(height: 8,),
                  Text("Rs ${product.p_cost}    Availability: ${product.p_availability}"),
                  SizedBox(height: 6,),

                  product.p_details.isNotEmpty
                      ? Text("Details: ${product.p_details}")
                      : Container(),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8),
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200]!)
                ),
                //color: Colors.cyan,
                child: Text("Qnt   ${cartItem.quantity}")
              ),
            ),
            SizedBox(width: 40,)
          ],
        )
      ]),
    );
  }
}


