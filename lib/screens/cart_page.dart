import 'package:flutter/material.dart';
import 'package:product_app/models/item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerCart = Provider.of<ItemModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        actions: [
          IconButton(
            onPressed: () {
              providerCart.clearItems();
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: providerCart.items.isEmpty
          ? Container(
              child: Text("No Data"),
            )
          : ListView.builder(
              itemCount: providerCart.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(providerCart.items[index].name),
                  subtitle: Text(providerCart.items[index].price.toString()),
                );
              }),
    );
  }
}
