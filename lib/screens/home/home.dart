import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yebelo_assign/models/product.dart';
import 'package:yebelo_assign/screens/home/product_list.dart';
import 'package:yebelo_assign/utils/utils.dart';

import '../../services/database_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String category = "All Categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Yebelo: Assignment",
            style: TextStyle(color: Colors.cyan),
          ),
          shape:
              Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1.5)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: StreamProvider<List<Product>>.value(
          initialData: [],
          value: DatabaseService().products,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 230,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search_outlined),
                          hintText: "Search",
                          fillColor: Colors.white,
                          filled: true,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 12),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(style: BorderStyle.none),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          category = value!;
                        });
                      },
                      icon: const Icon(Icons.arrow_downward),
                      value: category,
                      //hint: Text("Category",style: TextStyle(color: Colors.cyan),),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      items: dropDownItems,
                    ),
                  ],
                ),
                Flexible(
                  child: ProductList(
                    category: category,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
