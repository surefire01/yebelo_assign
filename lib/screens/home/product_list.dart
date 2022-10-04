
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yebelo_assign/screens/home/product_tile.dart';
import 'package:yebelo_assign/utils/utils.dart';

import '../../models/product.dart';

class ProductList extends StatelessWidget {

  String category;
  ProductList({required this.category});

  @override
  Widget build(BuildContext context) {
    final products = filter(Provider.of<List<Product>?>(context)!, category);

    return ListView.builder(
      itemCount: products!.length,
      itemBuilder: (context, index) {
        return ProductTile(product: products[index]);
      },
    );
  }
}

