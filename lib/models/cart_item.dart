import 'package:yebelo_assign/models/product.dart';

class CartItem{
  Product? product;
  int quantity =0;
  
  CartItem({required this.product,required this.quantity});

  CartItem.fromJson(Map map){
    product = Product.fromJson(map["product"]);
    quantity = map['quantity'];
  }

  Map<String,dynamic> toJson(){
    return {
      "product" : product!.toJson(),
      'quantity' : quantity
    };
  }
}