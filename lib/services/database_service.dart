import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yebelo_assign/models/cart_item.dart';
import 'package:yebelo_assign/models/product.dart';
import 'package:yebelo_assign/screens/cart/cart.dart';

class DatabaseService{
  DatabaseService();

  final CollectionReference productCollection = FirebaseFirestore.instance.collection('Products');


  
  List<Product> _productListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      var map = doc.data() as Map;

      return Product.fromJson(map);
    }).toList();
  }

  // create a stream for the change in the database
  Stream<List<Product>> get products{
    return productCollection.snapshots().map(_productListFromSnapshot);
  }

  final CollectionReference cartItemCollection = FirebaseFirestore.instance.collection('Cart items');

  Future createCartItem(CartItem cartItem)async{
    return cartItemCollection.doc().set(cartItem.toJson());
  }


  List<CartItem> _cartItemListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      var map = doc.data() as Map;

      return CartItem.fromJson(map);
    }).toList();
  }

  // create a stream for the change in the database
  Stream<List<CartItem>> get cartItems{
    return cartItemCollection.snapshots().map(_cartItemListFromSnapshot);
  }
  
  
}