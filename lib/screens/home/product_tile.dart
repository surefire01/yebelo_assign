import 'package:flutter/material.dart';
import 'package:yebelo_assign/utils/utils.dart';

import '../../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {

    void getQauntity ()async{
      await showDialog(context: context,
      builder: (BuildContext context) {
        return GetQauntity(product: product);
      }
          );
    }


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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 340,
              //color: Colors.cyan,
              child: TextButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color?>(Colors.grey[100]),),
                onPressed: (){
                  getQauntity();
                },
                child: Text("Add to Cart",style: TextStyle(color: Colors.blue),),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
